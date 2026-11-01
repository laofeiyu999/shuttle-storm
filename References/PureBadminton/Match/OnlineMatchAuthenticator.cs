using System;
using System.Collections.Generic;
using FishNet.Authenticating;
using FishNet.Connection;
using FishNet.Managing;
using FishNet.Transporting;
using OPS.Obfuscator.Attribute;
using UnityEngine;

[NotObfuscatedCause("Class: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: Obfuscator Free is used.")]
[NotObfuscatedCause("Namespace: MonoBehaviour obfuscation is deactivated - Obfuscator Free is used.")]
public class OnlineMatchAuthenticator : Authenticator
{
	private readonly Dictionary<NetworkConnection, string> lyr = new Dictionary<NetworkConnection, string>();

	private readonly bde lys = new bde();

	private float lyt;

	[NotObfuscatedCause("Some other Event in the Event group getting skipped.")]
	[method: NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	[method: NotObfuscatedCause("Belonging property gets skipped: Some other Event in the Event group getting skipped.")]
	[field: NotObfuscatedCause("Belonging event gets skipped: Some other Event in the Event group getting skipped.")]
	public override event Action<NetworkConnection, bool> OnAuthenticationResult;

	public event Action<NetworkConnection, string> lyq;

	public string eqz(NetworkConnection a)
	{
		if (!lyr.TryGetValue(a, out var value))
		{
			return null;
		}
		return value;
	}

	[NotObfuscatedCause("Some other Method in the Method group getting skipped.")]
	public override void InitializeOnce(NetworkManager networkManager)
	{
		base.InitializeOnce(networkManager);
		networkManager.ClientManager.OnClientConnectionState += era;
		networkManager.ClientManager.RegisterBroadcast<OnlineAuthResult>(erc);
		networkManager.ServerManager.RegisterBroadcast<OnlineAuthRequest>(erb, requireAuthentication: false);
		networkManager.ServerManager.OnRemoteConnectionState += erd;
	}

	private void era(ClientConnectionStateArgs a)
	{
		if (a.ConnectionState == LocalConnectionState.Started)
		{
			MatchSettings.qn online = MatchSettings.Current.Online;
			base.NetworkManager.ClientManager.Broadcast(new OnlineAuthRequest
			{
				PlayerId = online.mta,
				MatchToken = online.msx
			});
		}
	}

	private void erb(NetworkConnection a, OnlineAuthRequest b, Channel c)
	{
		if (a.IsAuthenticated || lyr.ContainsKey(a))
		{
			a.Disconnect(immediately: true);
			return;
		}
		bool c2 = bbm.ilh(base.NetworkManager.TransportManager.Transport.GetConnectionAddress(a.ClientId), OnlineEosService.nxb);
		bool flag = bbw.img(b.PlayerId, b.MatchToken, c2, MatchSettings.Current, lyr.Values);
		if (flag)
		{
			lyr[a] = b.PlayerId;
			lys.ium(a.ClientId);
		}
		else
		{
			Debug.LogWarning($"[OnlineAuth] refused {b.PlayerId} on connection {a.ClientId}");
		}
		base.NetworkManager.ServerManager.Broadcast(a, new OnlineAuthResult
		{
			Passed = flag
		}, requireAuthenticated: false);
		OnAuthenticationResult?.Invoke(a, flag);
		if (flag)
		{
			this.lyq?.Invoke(a, b.PlayerId);
		}
	}

	private void erc(OnlineAuthResult a, Channel b)
	{
		OnlineStartTrace.isw("auth_result", a.Passed ? "passed" : "refused");
		if (!a.Passed)
		{
			Debug.LogWarning("[OnlineAuth] the host refused this client");
		}
	}

	private void erd(NetworkConnection a, RemoteConnectionStateArgs b)
	{
		if (b.ConnectionState == RemoteConnectionState.Started)
		{
			lys.iul(a.ClientId, Time.unscaledTime);
		}
		else if (b.ConnectionState == RemoteConnectionState.Stopped)
		{
			lyr.Remove(a);
			lys.ium(a.ClientId);
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void Update()
	{
		if (base.NetworkManager == null || !base.NetworkManager.IsServerStarted || Time.unscaledTime < lyt)
		{
			return;
		}
		lyt = Time.unscaledTime + 1f;
		foreach (int item in lys.iun(Time.unscaledTime))
		{
			if (base.NetworkManager.ServerManager.Clients.TryGetValue(item, out var value))
			{
				Debug.LogWarning($"[OnlineAuth] connection {item} did not authenticate in " + $"{10f:0} s; disconnecting it");
				value.Disconnect(immediately: true);
			}
		}
	}

	[NotObfuscatedCause("Because of compatibility component: Unity - Compatibility : Is MonoBehaviour Method.")]
	private void OnDestroy()
	{
		if (!(base.NetworkManager == null))
		{
			base.NetworkManager.ClientManager.OnClientConnectionState -= era;
			base.NetworkManager.ServerManager.OnRemoteConnectionState -= erd;
		}
	}
}
