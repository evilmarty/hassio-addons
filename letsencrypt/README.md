# Home Assistant Add-on: Letsencrypt

Let's Encrypt is a certificate authority that provides free X.509 certificates for Transport Layer Security encryption via an automated process designed to eliminate the hitherto complex process of manual creation, validation, signing, installation, and renewal of certificates for secure websites.

![Supports amd64 Architecture][amd64-shield] ![Supports armv7 Architecture][armv7-shield] ![Supports i386 Architecture][i386-shield]

## About

This is similar to the official Home Assistant Let's Encrypt Add-on. The major difference is it uses the [Let's Encrypt Go Client](https://go-acme.github.io/lego/) instead of EFF's Certbot.

Setting up Letsencrypt allows you to use validated certificates for your webpages and webinterfaces.
It requires you to own the domain you are requesting the certificate for.

The generated certificate can be used within others addons. By default the path and file for the certificates within other addons will refer to the files generated within this addon.

## How to use

To use this add-on, you have two options on how to get your certificate:

### 1. http challenge

- Requires Port 80 to be available from the internet and your domain assigned to the externally assigned IP address
- Doesnt allow wildcard certificates (*.yourdomain.com).

### 2. dns challenge

- Requires you to use one of the supported DNS providers (See "Supported DNS providers" below)
- Allows to request wildcard certificates (*.yourdomain.com)
- Doesn’t need you to open a port to your Home Assistant host on your router.

### You always need to provide the following entries within the configuration

```yaml
email: your@email.com
domains:
  # use "*.yourdomain.com" for wildcard certificates.
  - yourdomain.com
challenge: http OR dns
```

IF you choose "dns" as "challenge", you will also need to fill:

```yaml
# Add the dnsprovider of your choice from the list of "Supported DNS providers" below
provider: ""
```

In addition add the fields according to the credentials required by your dns provider. For more information consult the [Let's Encrypt Go Client Documentation](https://go-acme.github.io/lego/dns/).


```yaml
propagation_seconds: 60
alicloud_access_key: ''
alicloud_secret_key: ''
aws_access_key_id: ''
aws_secret_access_key: ''
aws_region: ''
aws_hosted_zone_id: ''
dns_zone: ''
aurora_endpoint: ''
aurora_key: ''
aurora_user_id: ''
autodns_api_password: ''
autodns_api_user: ''
azure_client_id: ''
azure_client_secret: ''
azure_resource_group: ''
azure_subscription_id: ''
azure_tenant_id: ''
bindman_manager_address: ''
bluecat_config_name: ''
bluecat_dns_view: ''
bluecat_password: ''
bluecat_server_url: ''
bluecat_user_name: ''
checkdomain_token: ''
cloudns_auth_id: ''
cloudns_auth_password: ''
cloudxns_api_key: ''
cloudxns_secret_key: ''
cloudflare_api_email: ''
cloudflare_api_key: ''
cloudflare_dns_api_token: ''
cloudflare_zone_api_token: ''
conoha_api_password: ''
conoha_api_username: ''
conoha_tenant_id: ''
constellix_api_key: ''
constellix_secret_key: ''
dnsmadeeasy_api_key: ''
dnsmadeeasy_api_secret: ''
dnspod_api_key: ''
dnsimple_base_url: ''
dnsimple_oauth_token: ''
os_auth_url: ''
os_password: ''
os_project_name: ''
os_region_name: ''
os_tenant_name: ''
os_username: ''
do_auth_token: ''
dode_token: ''
dreamhost_api_key: ''
duckdns_token: ''
dyn_customer_name: ''
dyn_password: ''
dyn_user_name: ''
dynu_api_key: ''
easydns_key: ''
easydns_token: ''
exoscale_api_key: ''
exoscale_api_secret: ''
exoscale_endpoint: ''
akamai_access_token: ''
akamai_client_secret: ''
akamai_client_token: ''
akamai_host: ''
gandi_api_key: ''
gandiv5_api_key: ''
glesys_api_key: ''
glesys_api_user: ''
godaddy_api_key: ''
godaddy_api_secret: ''
gce_project: ''
gce_service_account: ''
gce_service_account_file: ''
httpreq_endpoint: ''
httpreq_mode: ''
hostingde_api_key: ''
hostingde_zone_name: ''
inwx_password: ''
inwx_username: ''
iij_api_access_key: ''
iij_api_secret_key: ''
iij_do_service_code: ''
joker_api_key: ''
joker_password: ''
joker_username: ''
acme_dns_api_base: ''
acme_dns_storage_path: ''
linode_api_key: ''
liquid_web_password: ''
liquid_web_username: ''
liquid_web_zone: ''
mydnsjp_master_id: ''
mydnsjp_password: ''
nifcloud_access_key_id: ''
nifcloud_secret_access_key: ''
ns1_api_key: ''
namecom_api_token: ''
namecom_username: ''
namecheap_api_key: ''
namecheap_api_user: ''
namesilo_api_key: ''
netcup_api_key: ''
netcup_api_password: ''
netcup_customer_number: ''
ovh_application_key: ''
ovh_application_secret: ''
ovh_consumer_key: ''
ovh_endpoint: ''
otc_domain_name: ''
otc_identity_endpoint: ''
otc_password: ''
otc_project_name: ''
otc_user_name: ''
oci_compartment_ocid: ''
oci_privkey_file: ''
oci_privkey_pass: ''
oci_pubkey_fingerprint: ''
oci_region: ''
oci_tenancy_ocid: ''
oci_user_ocid: ''
pdns_api_key: ''
pdns_api_url: ''
rfc2136_nameserver: ''
rfc2136_tsig_algorithm: ''
rfc2136_tsig_key: ''
rfc2136_tsig_secret: ''
rackspace_api_key: ''
rackspace_user: ''
rimuhosting_api_key: ''
sakuracloud_access_token: ''
sakuracloud_access_token_secret: ''
scaleway_api_token: ''
selectel_api_token: ''
servercow_password: ''
servercow_username: ''
stackpath_client_id: ''
stackpath_client_secret: ''
stackpath_stack_id: ''
transip_account_name: ''
transip_private_key_path: ''
secret_vegadns_key: ''
secret_vegadns_secret: ''
vegadns_url: ''
versio_password: ''
versio_username: ''
vscale_api_token: ''
vultr_api_key: ''
zoneee_api_key: ''
zoneee_api_user: ''
zonomi_api_key: ''
regru_password: ''
regru_username: ''
```

## Example Configurations

### http challenge

```yaml
email: hello@home-assistant.io
domains:
  - home-assistant.io
certfile: fullchain.pem
keyfile: privkey.pem
challenge: http
dns: {}
```

### dns challenge

```yaml
email: hello@home-assistant.io
domains:
  - home-assistant.io
certfile: fullchain.pem
keyfile: privkey.pem
challenge: dns
dns:
  provider: dns-cloudflare
  cloudflare_email: cf@home-assistant.io
  cloudflare_api_key: 31242lk3j4ljlfdwsjf0
```

## Certificate files

The certificate files will be available within the "ssl" share after successful request of the certificates.

By default other addons are referring to the correct path of the certificates.
You can in addition find the files via the "samba" addon within the "ssl" share.

## Supported DNS providers

```txt
- alidns
- lightsail
- route53
- auroradns
- autodns
- azure
- bindman
- bluecat
- checkdomain
- cloudns
- cloudxns
- cloudflare
- conoha
- constellix
- dnsmadeeasy
- dnspod
- dnsimple
- designate
- digitalocean
- dode
- dreamhost
- duckdns
- dyn
- dynu
- easydns
- exoscale
- fastdns
- gandi
- gandiv5
- glesys
- godaddy
- gcloud
- httpreq
- hostingde
- inwx
- iij
- joker
- acme-dns
- linode
- linodev4
- liquidweb
- mydnsjp
- nifcloud
- ns1
- namedotcom
- namecheap
- namesilo
- netcup
- ovh
- otc
- oraclecloud
- pdns
- rfc2136
- rackspace
- rimuhosting
- sakuracloud
- scaleway
- selectel
- servercow
- stackpath
- transip
- vegadns
- versio
- vscale
- vultr
- zoneee
- zonomi
- regru
```

## Support

While there is no warranty or support, you are welcome to raise an [Issue](https://github.com/evilmarty/hassio-addons/issues).
