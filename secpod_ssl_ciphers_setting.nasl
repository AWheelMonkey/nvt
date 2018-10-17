###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ssl_ciphers_setting.nasl 11665 2018-09-28 07:14:18Z cfischer $
#
# SSL/TLS: Cipher Settings
#
# Authors:
# Veerendra GG <veerendragg@secpod.com>
#
# Copyright:
# Copyright (c) 2010 SecPod, http://www.secpod.com
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

local_var sslv3_tls_ciphers;

# nb: Duplicated from secpod_ssl_ciphers.inc as we can't use includes before the
# description block starting from GOS 4.2.11 onwards
sslv3_tls_ciphers['TLS_NULL_WITH_NULL_NULL : Null cipher, no authentication'] = raw_string( 0x00, 0x00 );
sslv3_tls_ciphers['TLS_RSA_WITH_NULL_MD5 : Null cipher'] = raw_string( 0x00, 0x01 );
sslv3_tls_ciphers['TLS_RSA_WITH_NULL_SHA : Null cipher'] = raw_string( 0x00, 0x02 );
sslv3_tls_ciphers['TLS_RSA_EXPORT_WITH_RC4_40_MD5 : Weak cipher'] = raw_string( 0x00, 0x03 );
sslv3_tls_ciphers['TLS_RSA_WITH_RC4_128_MD5 : Weak cipher'] = raw_string( 0x00, 0x04 );
sslv3_tls_ciphers['TLS_RSA_WITH_RC4_128_SHA : Weak cipher'] = raw_string( 0x00, 0x05 );
sslv3_tls_ciphers['TLS_RSA_EXPORT_WITH_RC2_CBC_40_MD5 : Weak cipher'] = raw_string( 0x00, 0x06 );
sslv3_tls_ciphers['TLS_RSA_WITH_IDEA_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x07 );
sslv3_tls_ciphers['TLS_RSA_EXPORT_WITH_DES40_CBC_SHA : Weak cipher'] = raw_string( 0x00, 0x08 );
sslv3_tls_ciphers['TLS_RSA_WITH_DES_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x09 );
sslv3_tls_ciphers['TLS_RSA_WITH_3DES_EDE_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x0A );
sslv3_tls_ciphers['TLS_DH_DSS_EXPORT_WITH_DES40_CBC_SHA : Weak cipher'] = raw_string( 0x00, 0x0B );
sslv3_tls_ciphers['TLS_DH_DSS_WITH_DES_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x0C );
sslv3_tls_ciphers['TLS_DH_DSS_WITH_3DES_EDE_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x0D );
sslv3_tls_ciphers['TLS_DH_RSA_EXPORT_WITH_DES40_CBC_SHA : Weak cipher'] = raw_string( 0x00, 0x0E );
sslv3_tls_ciphers['TLS_DH_RSA_WITH_DES_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x0F );
sslv3_tls_ciphers['TLS_DH_RSA_WITH_3DES_EDE_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x10 );
sslv3_tls_ciphers['TLS_DHE_DSS_EXPORT_WITH_DES40_CBC_SHA : Weak cipher'] = raw_string( 0x00, 0x11 );
sslv3_tls_ciphers['TLS_DHE_DSS_WITH_DES_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x12 );
sslv3_tls_ciphers['TLS_DHE_DSS_WITH_3DES_EDE_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x13 );
sslv3_tls_ciphers['TLS_DHE_RSA_EXPORT_WITH_DES40_CBC_SHA : Weak cipher'] = raw_string( 0x00, 0x14 );
sslv3_tls_ciphers['TLS_DHE_RSA_WITH_DES_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x15 );
sslv3_tls_ciphers['TLS_DHE_RSA_WITH_3DES_EDE_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x16 );
sslv3_tls_ciphers['TLS_DH_anon_EXPORT_WITH_RC4_40_MD5 : Weak cipher'] = raw_string( 0x00, 0x17 );
sslv3_tls_ciphers['TLS_DH_anon_WITH_RC4_128_MD5 : Weak cipher'] = raw_string( 0x00, 0x18 );
sslv3_tls_ciphers['TLS_DH_anon_EXPORT_WITH_DES40_CBC_SHA : Weak cipher'] = raw_string( 0x00, 0x19 );
sslv3_tls_ciphers['TLS_DH_anon_WITH_DES_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x1A );
sslv3_tls_ciphers['TLS_DH_anon_WITH_3DES_EDE_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x1B );
sslv3_tls_ciphers['TLS_FORTEZZA_KEA_WITH_NULL_SHA : Null cipher'] = raw_string( 0x00, 0x1C );
sslv3_tls_ciphers['TLS_FORTEZZA_KEA_WITH_FORTEZZA_CBC_SHA : Weak cipher'] = raw_string( 0x00, 0x1D );

# Cipher suite ID 0x001E is double-attributed.
sslv3_tls_ciphers['TLS_FORTEZZA_KEA_WITH_RC4_128_SHA or TLS_KRB5_WITH_DES_CBC_SHA : Weak cipher'] = raw_string( 0x00, 0x1E );

sslv3_tls_ciphers['TLS_KRB5_WITH_3DES_EDE_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x1F );
sslv3_tls_ciphers['TLS_KRB5_WITH_RC4_128_SHA : Weak cipher'] = raw_string( 0x00, 0x20 );
sslv3_tls_ciphers['TLS_KRB5_WITH_IDEA_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x21 );
sslv3_tls_ciphers['TLS_KRB5_WITH_DES_CBC_MD5 : Medium cipher'] = raw_string( 0x00, 0x22 );
sslv3_tls_ciphers['TLS_KRB5_WITH_3DES_EDE_CBC_MD5 : Medium cipher'] = raw_string( 0x00, 0x23 );
sslv3_tls_ciphers['TLS_KRB5_WITH_RC4_128_MD5 : Weak cipher'] = raw_string( 0x00, 0x24 );
sslv3_tls_ciphers['TLS_KRB5_WITH_IDEA_CBC_MD5 : Medium cipher'] = raw_string( 0x00, 0x25 );
sslv3_tls_ciphers['TLS_KRB5_EXPORT_WITH_DES_CBC_40_SHA : Weak cipher'] = raw_string( 0x00, 0x26 );
sslv3_tls_ciphers['TLS_KRB5_EXPORT_WITH_RC2_CBC_40_SHA : Weak cipher'] = raw_string( 0x00, 0x27 );
sslv3_tls_ciphers['TLS_KRB5_EXPORT_WITH_RC4_40_SHA : Weak cipher'] = raw_string( 0x00, 0x28 );
sslv3_tls_ciphers['TLS_KRB5_EXPORT_WITH_DES_CBC_40_MD5 : Weak cipher'] = raw_string( 0x00, 0x29 );
sslv3_tls_ciphers['TLS_KRB5_EXPORT_WITH_RC2_CBC_40_MD5 : Weak cipher'] = raw_string( 0x00, 0x2A );
sslv3_tls_ciphers['TLS_KRB5_EXPORT_WITH_RC4_40_MD5 : Weak cipher'] = raw_string( 0x00, 0x2B );
sslv3_tls_ciphers['TLS_PSK_WITH_NULL_SHA : Null cipher'] = raw_string( 0x00, 0x2C );
sslv3_tls_ciphers['TLS_DHE_PSK_WITH_NULL_SHA : Null cipher'] = raw_string( 0x00, 0x2D );
sslv3_tls_ciphers['TLS_RSA_PSK_WITH_NULL_SHA : Null cipher'] = raw_string( 0x00, 0x2E );
sslv3_tls_ciphers['TLS_RSA_WITH_AES_128_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x2F );
sslv3_tls_ciphers['TLS_DH_DSS_WITH_AES_128_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x30 );
sslv3_tls_ciphers['TLS_DH_RSA_WITH_AES_128_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x31 );
sslv3_tls_ciphers['TLS_DHE_DSS_WITH_AES_128_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x32 );
sslv3_tls_ciphers['TLS_DHE_RSA_WITH_AES_128_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x33 );
sslv3_tls_ciphers['TLS_DH_anon_WITH_AES_128_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x34 );
sslv3_tls_ciphers['TLS_RSA_WITH_AES_256_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x35 );
sslv3_tls_ciphers['TLS_DH_DSS_WITH_AES_256_CBC_SHA : Strong cipher'] = raw_string( 0x00, 0x36 );
sslv3_tls_ciphers['TLS_DH_RSA_WITH_AES_256_CBC_SHA : Strong cipher'] = raw_string( 0x00, 0x37 );
sslv3_tls_ciphers['TLS_DHE_DSS_WITH_AES_256_CBC_SHA : Strong cipher'] = raw_string( 0x00, 0x38 );
sslv3_tls_ciphers['TLS_DHE_RSA_WITH_AES_256_CBC_SHA : Strong cipher'] = raw_string( 0x00, 0x39 );
sslv3_tls_ciphers['TLS_DH_anon_WITH_AES_256_CBC_SHA : Strong cipher'] = raw_string( 0x00, 0x3A );
sslv3_tls_ciphers['TLS_RSA_WITH_NULL_SHA256 : Null cipher'] = raw_string( 0x00, 0x3B );
sslv3_tls_ciphers['TLS_RSA_WITH_AES_128_CBC_SHA256 : Medium cipher'] = raw_string( 0x00, 0x3C );
sslv3_tls_ciphers['TLS_RSA_WITH_AES_256_CBC_SHA256 : Medium cipher'] = raw_string( 0x00, 0x3D );
sslv3_tls_ciphers['TLS_DH_DSS_WITH_AES_128_CBC_SHA256 : Medium cipher'] = raw_string( 0x00, 0x3E );
sslv3_tls_ciphers['TLS_DH_RSA_WITH_AES_128_CBC_SHA256 : Medium cipher'] = raw_string( 0x00, 0x3F );
sslv3_tls_ciphers['TLS_DHE_DSS_WITH_AES_128_CBC_SHA256 : Medium cipher'] = raw_string( 0x00, 0x40 );
sslv3_tls_ciphers['TLS_RSA_WITH_CAMELLIA_128_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x41 );
sslv3_tls_ciphers['TLS_DH_DSS_WITH_CAMELLIA_128_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x42 );
sslv3_tls_ciphers['TLS_DH_RSA_WITH_CAMELLIA_128_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x43 );
sslv3_tls_ciphers['TLS_DHE_DSS_WITH_CAMELLIA_128_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x44 );
sslv3_tls_ciphers['TLS_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x45 );
sslv3_tls_ciphers['TLS_DH_anon_WITH_CAMELLIA_128_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x46 );

## unassigned/reserved cipher codes for draft/temporary implementations & backward compatibility.
## Some servers might implement those.
sslv3_tls_ciphers['TLS_ECDH_ECDSA_WITH_NULL_SHA (Draft) : Null cipher'] = raw_string( 0x00, 0x47 );
sslv3_tls_ciphers['TLS_ECDH_ECDSA_WITH_RC4_128_SHA (Draft) : Weak cipher'] = raw_string( 0x00, 0x48 );
sslv3_tls_ciphers['TLS_ECDH_ECDSA_WITH_DES_CBC_SHA (Draft) : Medium cipher'] = raw_string( 0x00, 0x49 );
sslv3_tls_ciphers['TLS_ECDH_ECDSA_WITH_3DES_EDE_CBC_SHA (Draft) : Medium cipher'] = raw_string( 0x00, 0x4A );

# Cipher suite ID 0x004B and 0x004C are double-attributed.
sslv3_tls_ciphers['TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA (Draft) or TLS_ECDH_ECDSA_EXPORT_WITH_RC4_40_SHA (Draft) : Weak cipher'] = raw_string( 0x00, 0x4B );
sslv3_tls_ciphers['TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA (Draft) or TLS_ECDH_ECDSA_EXPORT_WITH_RC4_56_SHA (Draft) : Weak cipher'] = raw_string( 0x00, 0x4C );

sslv3_tls_ciphers['TLS_ECDH_RSA_WITH_NULL_SHA (Draft) : Null cipher'] = raw_string( 0x00, 0x4D );
sslv3_tls_ciphers['TLS_ECDH_RSA_WITH_RC4_128_SHA (Draft) : Weak cipher'] = raw_string( 0x00, 0x4E );
sslv3_tls_ciphers['TLS_ECDH_RSA_WITH_DES_CBC_SHA (Draft) : Medium cipher'] = raw_string( 0x00, 0x4F );

# Cipher suite ID 0x0050-> 0x0058 are double-attributed.
sslv3_tls_ciphers['TLS_ECDH_RSA_WITH_3DES_EDE_CBC_SHA (Draft) or TLS_SRP_SHA_WITH_3DES_EDE_CBC_SHA (Draft) : Medium cipher'] = raw_string( 0x00, 0x50 );
sslv3_tls_ciphers['TLS_ECDH_RSA_WITH_AES_128_CBC_SHA (Draft) or TLS_SRP_SHA_RSA_WITH_3DES_EDE_CBC_SHA (Draft) : Medium cipher'] = raw_string( 0x00, 0x51 );
sslv3_tls_ciphers['TLS_ECDH_RSA_WITH_AES_256_CBC_SHA (Draft) or TLS_SRP_SHA_DSS_WITH_3DES_EDE_CBC_SHA (Draft) : Medium cipher'] = raw_string( 0x00, 0x52 );
sslv3_tls_ciphers['TLS_ECDH_RSA_EXPORT_WITH_RC4_40_SHA (Draft) or TLS_SRP_SHA_WITH_AES_128_CBC_SHA (Draft) : Weak cipher'] = raw_string( 0x00, 0x53 );
sslv3_tls_ciphers['TLS_ECDH_RSA_EXPORT_WITH_RC4_56_SHA (Draft) or TLS_SRP_SHA_RSA_WITH_AES_128_CBC_SHA (Draft) : Weak cipher'] = raw_string( 0x00, 0x54 );
sslv3_tls_ciphers['TLS_ECDH_anon_NULL_WITH_SHA (Draft) or TLS_SRP_SHA_DSS_WITH_AES_128_CBC_SHA (Draft) : Null cipher'] = raw_string( 0x00, 0x55 );
sslv3_tls_ciphers['TLS_ECDH_anon_WITH_RC4_128_SHA (Draft) or TLS_SRP_SHA_WITH_AES_256_CBC_SHA (Draft) : Weak cipher'] = raw_string( 0x00, 0x56 );
sslv3_tls_ciphers['TLS_ECDH_anon_WITH_DES_CBC_SHA (Draft) or TLS_SRP_SHA_RSA_WITH_AES_256_CBC_SHA (Draft) : Medium cipher'] = raw_string( 0x00, 0x57 );
sslv3_tls_ciphers['TLS_ECDH_anon_WITH_3DES_EDE_CBC_SHA (Draft) or TLS_SRP_SHA_DSS_WITH_AES_256_CBC_SHA (Draft) : Medium cipher'] = raw_string( 0x00, 0x58 );

## unassigned/reserved cipher codes for draft/temporary implementations & backward compatibility.
## Some servers might implement those.
sslv3_tls_ciphers['TLS_ECDH_anon_EXPORT_WITH_DES40_CBC_SHA (Draft) : Weak cipher'] = raw_string( 0x00, 0x59 );
sslv3_tls_ciphers['TLS_ECDH_anon_EXPORT_WITH_RC4_40_SHA (Draft) : Weak cipher'] = raw_string( 0x00, 0x5A );
sslv3_tls_ciphers['TLS_ECDH_anon_EXPORT_WITH_DES40_CBC_SHA (Draft) : Weak cipher'] = raw_string( 0x00, 0x5B );
sslv3_tls_ciphers['TLS_ECDH_anon_EXPORT_WITH_RC4_40_SHA (Draft) : Weak cipher'] = raw_string( 0x00, 0x5C );

sslv3_tls_ciphers['TLS_RSA_EXPORT1024_WITH_RC4_56_MD5 : Weak cipher, weak authentication'] = raw_string( 0x00, 0x60 );
sslv3_tls_ciphers['TLS_RSA_EXPORT1024_WITH_RC2_CBC_56_MD5 : Weak cipher, weak authentication'] = raw_string( 0x00, 0x61 );
sslv3_tls_ciphers['TLS_RSA_EXPORT1024_WITH_DES_CBC_SHA : Weak cipher, weak authentication'] = raw_string( 0x00, 0x62 );
sslv3_tls_ciphers['TLS_DHE_DSS_EXPORT1024_WITH_DES_CBC_SHA : Weak cipher, weak authentication'] = raw_string( 0x00, 0x63 );
sslv3_tls_ciphers['TLS_RSA_EXPORT1024_WITH_RC4_56_SHA : Weak cipher, weak authentication'] = raw_string( 0x00, 0x64 );
sslv3_tls_ciphers['TLS_DHE_DSS_EXPORT1024_WITH_RC4_56_SHA : Weak cipher, weak authentication'] = raw_string( 0x00, 0x65 );
sslv3_tls_ciphers['TLS_DHE_DSS_WITH_RC4_128_SHA : Weak cipher'] = raw_string( 0x00, 0x66 );
sslv3_tls_ciphers['TLS_DHE_RSA_WITH_AES_128_CBC_SHA256 : Medium cipher'] = raw_string( 0x00, 0x67 );
sslv3_tls_ciphers['TLS_DH_DSS_WITH_AES_256_CBC_SHA256 : Medium cipher'] = raw_string( 0x00, 0x68 );
sslv3_tls_ciphers['TLS_DH_RSA_WITH_AES_256_CBC_SHA256 : Medium cipher'] = raw_string( 0x00, 0x69 );
sslv3_tls_ciphers['TLS_DHE_DSS_WITH_AES_256_CBC_SHA256 : Medium cipher'] = raw_string( 0x00, 0x6A );
sslv3_tls_ciphers['TLS_DHE_RSA_WITH_AES_256_CBC_SHA256 : Medium cipher'] = raw_string( 0x00, 0x6B );
sslv3_tls_ciphers['TLS_DH_anon_WITH_AES_128_CBC_SHA256 : Medium cipher'] = raw_string( 0x00, 0x6C );
sslv3_tls_ciphers['TLS_DH_anon_WITH_AES_256_CBC_SHA256 : Medium cipher'] = raw_string( 0x00, 0x6D );

## unassigned/reserved cipher codes for draft/temporary implementations & backward compatibility.
## Some servers might implement those.
sslv3_tls_ciphers['TLS_KRB5_WITH_3DES_EDE_CBC_SHA (Draft) : Medium cipher'] = raw_string( 0x00, 0x70 );
sslv3_tls_ciphers['TLS_KRB5_WITH_3DES_EDE_CBC_MD5 (Draft) : Medium cipher'] = raw_string( 0x00, 0x71 );
sslv3_tls_ciphers['TLS_KRB5_WITH_RC4_128_SHA (Draft) : Weak cipher'] = raw_string( 0x00, 0x72 );
sslv3_tls_ciphers['TLS_KRB5_WITH_RC4_128_MD5 (Draft) : Weak cipher'] = raw_string( 0x00, 0x73 );
sslv3_tls_ciphers['TLS_KRB5_WITH_DES_CBC_SHA (Draft) : Medium cipher'] = raw_string( 0x00, 0x74 );
sslv3_tls_ciphers['TLS_KRB5_WITH_DES_CBC_MD5 (Draft) : Medium cipher'] = raw_string( 0x00, 0x75 );
sslv3_tls_ciphers['TLS_KRB5_WITH_AES_128_CBC_SHA (Draft) : Weak cipher'] = raw_string( 0x00, 0x76 );
sslv3_tls_ciphers['TLS_KRB5_WITH_AES_256_CBC_SHA (Draft) : Weak cipher'] = raw_string( 0x00, 0x77 );
sslv3_tls_ciphers['TLS_KRB5_WITH_NULL_SHA (Draft) : Null cipher'] = raw_string( 0x00, 0x78 );
sslv3_tls_ciphers['TLS_KRB5_WITH_NULL_MD5 (Draft) : Null cipher'] = raw_string( 0x00, 0x79 );
sslv3_tls_ciphers['TLS_GOSTR341094_WITH_28147_CNT_IMIT (Draft) : Strong cipher'] = raw_string( 0x00, 0x80 );
sslv3_tls_ciphers['TLS_GOSTR341001_WITH_28147_CNT_IMIT (Draft) : Strong cipher'] = raw_string( 0x00, 0x81 );
sslv3_tls_ciphers['TLS_GOSTR341094_WITH_NULL_GOSTR3411 (Draft) : Null cipher'] = raw_string( 0x00, 0x82 );
sslv3_tls_ciphers['TLS_GOSTR341001_WITH_NULL_GOSTR3411 (Draft) : Null cipher'] = raw_string( 0x00, 0x83 );

sslv3_tls_ciphers['TLS_RSA_WITH_CAMELLIA_256_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x84 );
sslv3_tls_ciphers['TLS_DH_DSS_WITH_CAMELLIA_256_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x85 );
sslv3_tls_ciphers['TLS_DH_RSA_WITH_CAMELLIA_256_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x86 );
sslv3_tls_ciphers['TLS_DHE_DSS_WITH_CAMELLIA_256_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x87 );
sslv3_tls_ciphers['TLS_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x88 );
sslv3_tls_ciphers['TLS_DH_anon_WITH_CAMELLIA_256_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x89 );
sslv3_tls_ciphers['TLS_PSK_WITH_RC4_128_SHA : Weak cipher'] = raw_string( 0x00, 0x8A );
sslv3_tls_ciphers['TLS_PSK_WITH_3DES_EDE_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x8B );
sslv3_tls_ciphers['TLS_PSK_WITH_AES_128_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x8C );
sslv3_tls_ciphers['TLS_PSK_WITH_AES_256_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x8D );
sslv3_tls_ciphers['TLS_DHE_PSK_WITH_RC4_128_SHA : Weak cipher'] = raw_string( 0x00, 0x8E );
sslv3_tls_ciphers['TLS_DHE_PSK_WITH_3DES_EDE_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x8F );
sslv3_tls_ciphers['TLS_DHE_PSK_WITH_AES_128_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x90 );
sslv3_tls_ciphers['TLS_DHE_PSK_WITH_AES_256_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x91 );
sslv3_tls_ciphers['TLS_RSA_PSK_WITH_RC4_128_SHA : Weak cipher'] = raw_string( 0x00, 0x92 );
sslv3_tls_ciphers['TLS_RSA_PSK_WITH_3DES_EDE_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x93 );
sslv3_tls_ciphers['TLS_RSA_PSK_WITH_AES_128_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x94 );
sslv3_tls_ciphers['TLS_RSA_PSK_WITH_AES_256_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x95 );
sslv3_tls_ciphers['TLS_RSA_WITH_SEED_CBC_SHA : Weak cipher'] = raw_string( 0x00, 0x96 );
sslv3_tls_ciphers['TLS_DH_DSS_WITH_SEED_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x97 );
sslv3_tls_ciphers['TLS_DH_RSA_WITH_SEED_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x98 );
sslv3_tls_ciphers['TLS_DHE_DSS_WITH_SEED_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x99 );
sslv3_tls_ciphers['TLS_DHE_RSA_WITH_SEED_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x9A );
sslv3_tls_ciphers['TLS_DH_anon_WITH_SEED_CBC_SHA : Medium cipher'] = raw_string( 0x00, 0x9B );
sslv3_tls_ciphers['TLS_RSA_WITH_AES_128_GCM_SHA256 : Medium cipher'] = raw_string( 0x00, 0x9C );
sslv3_tls_ciphers['TLS_RSA_WITH_AES_256_GCM_SHA384 : Medium cipher'] = raw_string( 0x00, 0x9D );
sslv3_tls_ciphers['TLS_DHE_RSA_WITH_AES_128_GCM_SHA256 : Medium cipher'] = raw_string( 0x00, 0x9E );
sslv3_tls_ciphers['TLS_DHE_RSA_WITH_AES_256_GCM_SHA384 : Medium cipher'] = raw_string( 0x00, 0x9F );
sslv3_tls_ciphers['TLS_DH_RSA_WITH_AES_128_GCM_SHA256 : Medium cipher'] = raw_string( 0x00, 0xA0 );
sslv3_tls_ciphers['TLS_DH_RSA_WITH_AES_256_GCM_SHA384 : Medium cipher'] = raw_string( 0x00, 0xA1 );
sslv3_tls_ciphers['TLS_DHE_DSS_WITH_AES_128_GCM_SHA256 : Medium cipher'] = raw_string( 0x00, 0xA2 );
sslv3_tls_ciphers['TLS_DHE_DSS_WITH_AES_256_GCM_SHA384 : Medium cipher'] = raw_string( 0x00, 0xA3 );
sslv3_tls_ciphers['TLS_DH_DSS_WITH_AES_128_GCM_SHA256 : Medium cipher'] = raw_string( 0x00, 0xA4 );
sslv3_tls_ciphers['TLS_DH_DSS_WITH_AES_256_GCM_SHA384 : Medium cipher'] = raw_string( 0x00, 0xA5 );
sslv3_tls_ciphers['TLS_DH_anon_WITH_AES_128_GCM_SHA256 : Medium cipher'] = raw_string( 0x00, 0xA6 );
sslv3_tls_ciphers['TLS_DH_anon_WITH_AES_256_GCM_SHA384 : Medium cipher'] = raw_string( 0x00, 0xA7 );
sslv3_tls_ciphers['TLS_PSK_WITH_AES_128_GCM_SHA256 : Medium cipher'] = raw_string( 0x00, 0xA8 );
sslv3_tls_ciphers['TLS_PSK_WITH_AES_256_GCM_SHA384 : Medium cipher'] = raw_string( 0x00, 0xA9 );
sslv3_tls_ciphers['TLS_DHE_PSK_WITH_AES_128_GCM_SHA256 : Medium cipher'] = raw_string( 0x00, 0xAA );
sslv3_tls_ciphers['TLS_DHE_PSK_WITH_AES_256_GCM_SHA384 : Medium cipher'] = raw_string( 0x00, 0xAB );
sslv3_tls_ciphers['TLS_RSA_PSK_WITH_AES_128_GCM_SHA256 : Medium cipher'] = raw_string( 0x00, 0xAC );
sslv3_tls_ciphers['TLS_RSA_PSK_WITH_AES_256_GCM_SHA384 : Medium cipher'] = raw_string( 0x00, 0xAD );
sslv3_tls_ciphers['TLS_PSK_WITH_AES_128_CBC_SHA256 : Medium cipher'] = raw_string( 0x00, 0xAE );
sslv3_tls_ciphers['TLS_PSK_WITH_AES_256_CBC_SHA384 : Medium cipher'] = raw_string( 0x00, 0xAF );
sslv3_tls_ciphers['TLS_PSK_WITH_NULL_SHA256 : Null cipher'] = raw_string( 0x00, 0xB0 );
sslv3_tls_ciphers['TLS_PSK_WITH_NULL_SHA384 : Null cipher'] = raw_string( 0x00, 0xB1 );
sslv3_tls_ciphers['TLS_DHE_PSK_WITH_AES_128_CBC_SHA256 : Medium cipher'] = raw_string( 0x00, 0xB2 );
sslv3_tls_ciphers['TLS_DHE_PSK_WITH_AES_256_CBC_SHA384 : Medium cipher'] = raw_string( 0x00, 0xB3 );
sslv3_tls_ciphers['TLS_DHE_PSK_WITH_NULL_SHA256 : Null cipher'] = raw_string( 0x00, 0xB4 );
sslv3_tls_ciphers['TLS_DHE_PSK_WITH_NULL_SHA384 : Null cipher'] = raw_string( 0x00, 0xB5 );
sslv3_tls_ciphers['TLS_RSA_PSK_WITH_AES_128_CBC_SHA256 : Medium cipher'] = raw_string( 0x00, 0xB6 );
sslv3_tls_ciphers['TLS_RSA_PSK_WITH_AES_256_CBC_SHA384 : Medium cipher'] = raw_string( 0x00, 0xB7 );
sslv3_tls_ciphers['TLS_RSA_PSK_WITH_NULL_SHA256 : Null cipher'] = raw_string( 0x00, 0xB8 );
sslv3_tls_ciphers['TLS_RSA_PSK_WITH_NULL_SHA384 : Null cipher'] = raw_string( 0x00, 0xB9 );
sslv3_tls_ciphers['TLS_RSA_WITH_CAMELLIA_128_CBC_SHA256 : Medium cipher'] = raw_string( 0x00, 0xBA );
sslv3_tls_ciphers['TLS_DH_DSS_WITH_CAMELLIA_128_CBC_SHA256 : Medium cipher'] = raw_string( 0x00, 0xBB );
sslv3_tls_ciphers['TLS_DH_RSA_WITH_CAMELLIA_128_CBC_SHA256 : Medium cipher'] = raw_string( 0x00, 0xBC );
sslv3_tls_ciphers['TLS_DHE_DSS_WITH_CAMELLIA_128_CBC_SHA256 : Medium cipher'] = raw_string( 0x00, 0xBD );
sslv3_tls_ciphers['TLS_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA256 : Medium cipher'] = raw_string( 0x00, 0xBE );
sslv3_tls_ciphers['TLS_DH_anon_WITH_CAMELLIA_128_CBC_SHA256 : Medium cipher'] = raw_string( 0x00, 0xBF );
sslv3_tls_ciphers['TLS_RSA_WITH_CAMELLIA_256_CBC_SHA256 : Medium cipher'] = raw_string( 0x00, 0xC0 );
sslv3_tls_ciphers['TLS_DH_DSS_WITH_CAMELLIA_256_CBC_SHA256 : Medium cipher'] = raw_string( 0x00, 0xC1 );
sslv3_tls_ciphers['TLS_DH_RSA_WITH_CAMELLIA_256_CBC_SHA256 : Medium cipher'] = raw_string( 0x00, 0xC2 );
sslv3_tls_ciphers['TLS_DHE_DSS_WITH_CAMELLIA_256_CBC_SHA256 : Medium cipher'] = raw_string( 0x00, 0xC3 );
sslv3_tls_ciphers['TLS_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA256 : Medium cipher'] = raw_string( 0x00, 0xC4 );
sslv3_tls_ciphers['TLS_DH_anon_WITH_CAMELLIA_256_CBC_SHA256 : Medium cipher'] = raw_string( 0x00, 0xC5 );
sslv3_tls_ciphers['TLS_ECDH_ECDSA_WITH_NULL_SHA : Null cipher'] = raw_string( 0xC0, 0x01 );
sslv3_tls_ciphers['TLS_ECDH_ECDSA_WITH_RC4_128_SHA : Weak cipher'] = raw_string( 0xC0, 0x02 );
sslv3_tls_ciphers['TLS_ECDH_ECDSA_WITH_3DES_EDE_CBC_SHA : Medium cipher'] = raw_string( 0xC0, 0x03 );
sslv3_tls_ciphers['TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA : Medium cipher'] = raw_string( 0xC0, 0x04 );
sslv3_tls_ciphers['TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA : Medium cipher'] = raw_string( 0xC0, 0x05 );
sslv3_tls_ciphers['TLS_ECDHE_ECDSA_WITH_NULL_SHA : Null cipher'] = raw_string( 0xC0, 0x06 );
sslv3_tls_ciphers['TLS_ECDHE_ECDSA_WITH_RC4_128_SHA : Weak cipher'] = raw_string( 0xC0, 0x07 );
sslv3_tls_ciphers['TLS_ECDHE_ECDSA_WITH_3DES_EDE_CBC_SHA : Medium cipher'] = raw_string( 0xC0, 0x08 );
sslv3_tls_ciphers['TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA : Medium cipher'] = raw_string( 0xC0, 0x09 );
sslv3_tls_ciphers['TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA : Medium cipher'] = raw_string( 0xC0, 0x0A );
sslv3_tls_ciphers['TLS_ECDH_RSA_WITH_NULL_SHA : Null cipher'] = raw_string( 0xC0, 0x0B );
sslv3_tls_ciphers['TLS_ECDH_RSA_WITH_RC4_128_SHA : Weak cipher'] = raw_string( 0xC0, 0x0C );
sslv3_tls_ciphers['TLS_ECDH_RSA_WITH_3DES_EDE_CBC_SHA : Medium cipher'] = raw_string( 0xC0, 0x0D );
sslv3_tls_ciphers['TLS_ECDH_RSA_WITH_AES_128_CBC_SHA : Medium cipher'] = raw_string( 0xC0, 0x0E );
sslv3_tls_ciphers['TLS_ECDH_RSA_WITH_AES_256_CBC_SHA : Medium cipher'] = raw_string( 0xC0, 0x0F );
sslv3_tls_ciphers['TLS_ECDHE_RSA_WITH_NULL_SHA : Null cipher'] = raw_string( 0xC0, 0x10 );
sslv3_tls_ciphers['TLS_ECDHE_RSA_WITH_RC4_128_SHA : Weak cipher'] = raw_string( 0xC0, 0x11 );
sslv3_tls_ciphers['TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA : Medium cipher'] = raw_string( 0xC0, 0x12 );
sslv3_tls_ciphers['TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA : Medium cipher'] = raw_string( 0xC0, 0x13 );
sslv3_tls_ciphers['TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA : Medium cipher'] = raw_string( 0xC0, 0x14 );
sslv3_tls_ciphers['TLS_ECDH_anon_WITH_NULL_SHA : Null cipher'] = raw_string( 0xC0, 0x15 );
sslv3_tls_ciphers['TLS_ECDH_anon_WITH_RC4_128_SHA : Weak cipher'] = raw_string( 0xC0, 0x16 );
sslv3_tls_ciphers['TLS_ECDH_anon_WITH_3DES_EDE_CBC_SHA : Medium cipher'] = raw_string( 0xC0, 0x17 );
sslv3_tls_ciphers['TLS_ECDH_anon_WITH_AES_128_CBC_SHA : Medium cipher'] = raw_string( 0xC0, 0x18 );
sslv3_tls_ciphers['TLS_ECDH_anon_WITH_AES_256_CBC_SHA : Medium cipher'] = raw_string( 0xC0, 0x19 );
sslv3_tls_ciphers['TLS_SRP_SHA_WITH_3DES_EDE_CBC_SHA : Medium cipher'] = raw_string( 0xC0, 0x1A );
sslv3_tls_ciphers['TLS_SRP_SHA_RSA_WITH_3DES_EDE_CBC_SHA : Medium cipher'] = raw_string( 0xC0, 0x1B );
sslv3_tls_ciphers['TLS_SRP_SHA_DSS_WITH_3DES_EDE_CBC_SHA : Medium cipher'] = raw_string( 0xC0, 0x1C );
sslv3_tls_ciphers['TLS_SRP_SHA_WITH_AES_128_CBC_SHA : Medium cipher'] = raw_string( 0xC0, 0x1D );
sslv3_tls_ciphers['TLS_SRP_SHA_RSA_WITH_AES_128_CBC_SHA : Medium cipher'] = raw_string( 0xC0, 0x1E );
sslv3_tls_ciphers['TLS_SRP_SHA_DSS_WITH_AES_128_CBC_SHA : Medium cipher'] = raw_string( 0xC0, 0x1F );
sslv3_tls_ciphers['TLS_SRP_SHA_WITH_AES_256_CBC_SHA : Medium cipher'] = raw_string( 0xC0, 0x20 );
sslv3_tls_ciphers['TLS_SRP_SHA_RSA_WITH_AES_256_CBC_SHA : Medium cipher'] = raw_string( 0xC0, 0x21 );
sslv3_tls_ciphers['TLS_SRP_SHA_DSS_WITH_AES_256_CBC_SHA : Medium cipher'] = raw_string( 0xC0, 0x22 );
sslv3_tls_ciphers['TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x23 );
sslv3_tls_ciphers['TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x24 );
sslv3_tls_ciphers['TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x25 );
sslv3_tls_ciphers['TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x26 );
sslv3_tls_ciphers['TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x27 );
sslv3_tls_ciphers['TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x28 );
sslv3_tls_ciphers['TLS_ECDH_RSA_WITH_AES_128_CBC_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x29 );
sslv3_tls_ciphers['TLS_ECDH_RSA_WITH_AES_256_CBC_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x2A );
sslv3_tls_ciphers['TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x2B );
sslv3_tls_ciphers['TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x2C );
sslv3_tls_ciphers['TLS_ECDH_ECDSA_WITH_AES_128_GCM_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x2D );
sslv3_tls_ciphers['TLS_ECDH_ECDSA_WITH_AES_256_GCM_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x2E );
sslv3_tls_ciphers['TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x2F );
sslv3_tls_ciphers['TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x30 );
sslv3_tls_ciphers['TLS_ECDH_RSA_WITH_AES_128_GCM_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x31 );
sslv3_tls_ciphers['TLS_ECDH_RSA_WITH_AES_256_GCM_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x32 );
sslv3_tls_ciphers['TLS_ECDHE_PSK_WITH_RC4_128_SHA : Weak cipher'] = raw_string( 0xC0, 0x33 );
sslv3_tls_ciphers['TLS_ECDHE_PSK_WITH_3DES_EDE_CBC_SHA : Medium cipher'] = raw_string( 0xC0, 0x34 );
sslv3_tls_ciphers['TLS_ECDHE_PSK_WITH_AES_128_CBC_SHA : Medium cipher'] = raw_string( 0xC0, 0x35 );
sslv3_tls_ciphers['TLS_ECDHE_PSK_WITH_AES_256_CBC_SHA : Medium cipher'] = raw_string( 0xC0, 0x36 );
sslv3_tls_ciphers['TLS_ECDHE_PSK_WITH_AES_128_CBC_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x37 );
sslv3_tls_ciphers['TLS_ECDHE_PSK_WITH_AES_256_CBC_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x38 );
sslv3_tls_ciphers['TLS_ECDHE_PSK_WITH_NULL_SHA : Null cipher'] = raw_string( 0xC0, 0x39 );
sslv3_tls_ciphers['TLS_ECDHE_PSK_WITH_NULL_SHA256 : Null cipher'] = raw_string( 0xC0, 0x3A );
sslv3_tls_ciphers['TLS_ECDHE_PSK_WITH_NULL_SHA384 : Null cipher'] = raw_string( 0xC0, 0x3B );
sslv3_tls_ciphers['TLS_RSA_WITH_ARIA_128_CBC_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x3C );
sslv3_tls_ciphers['TLS_RSA_WITH_ARIA_256_CBC_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x3D );
sslv3_tls_ciphers['TLS_DH_DSS_WITH_ARIA_128_CBC_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x3E );
sslv3_tls_ciphers['TLS_DH_DSS_WITH_ARIA_256_CBC_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x3F );
sslv3_tls_ciphers['TLS_DH_RSA_WITH_ARIA_128_CBC_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x40 );
sslv3_tls_ciphers['TLS_DH_RSA_WITH_ARIA_256_CBC_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x41 );
sslv3_tls_ciphers['TLS_DHE_DSS_WITH_ARIA_128_CBC_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x42 );
sslv3_tls_ciphers['TLS_DHE_DSS_WITH_ARIA_256_CBC_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x43 );
sslv3_tls_ciphers['TLS_DHE_RSA_WITH_ARIA_128_CBC_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x44 );
sslv3_tls_ciphers['TLS_DHE_RSA_WITH_ARIA_256_CBC_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x45 );
sslv3_tls_ciphers['TLS_DH_anon_WITH_ARIA_128_CBC_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x46 );
sslv3_tls_ciphers['TLS_DH_anon_WITH_ARIA_256_CBC_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x47 );
sslv3_tls_ciphers['TLS_ECDHE_ECDSA_WITH_ARIA_128_CBC_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x48 );
sslv3_tls_ciphers['TLS_ECDHE_ECDSA_WITH_ARIA_256_CBC_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x49 );
sslv3_tls_ciphers['TLS_ECDH_ECDSA_WITH_ARIA_128_CBC_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x4A );
sslv3_tls_ciphers['TLS_ECDH_ECDSA_WITH_ARIA_256_CBC_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x4B );
sslv3_tls_ciphers['TLS_ECDHE_RSA_WITH_ARIA_128_CBC_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x4C );
sslv3_tls_ciphers['TLS_ECDHE_RSA_WITH_ARIA_256_CBC_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x4D );
sslv3_tls_ciphers['TLS_ECDH_RSA_WITH_ARIA_128_CBC_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x4E );
sslv3_tls_ciphers['TLS_ECDH_RSA_WITH_ARIA_256_CBC_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x4F );
sslv3_tls_ciphers['TLS_RSA_WITH_ARIA_128_GCM_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x50 );
sslv3_tls_ciphers['TLS_RSA_WITH_ARIA_256_GCM_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x51 );
sslv3_tls_ciphers['TLS_DHE_RSA_WITH_ARIA_128_GCM_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x52 );
sslv3_tls_ciphers['TLS_DHE_RSA_WITH_ARIA_256_GCM_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x53 );
sslv3_tls_ciphers['TLS_DH_RSA_WITH_ARIA_128_GCM_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x54 );
sslv3_tls_ciphers['TLS_DH_RSA_WITH_ARIA_256_GCM_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x55 );
sslv3_tls_ciphers['TLS_DHE_DSS_WITH_ARIA_128_GCM_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x56 );
sslv3_tls_ciphers['TLS_DHE_DSS_WITH_ARIA_256_GCM_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x57 );
sslv3_tls_ciphers['TLS_DH_DSS_WITH_ARIA_128_GCM_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x58 );
sslv3_tls_ciphers['TLS_DH_DSS_WITH_ARIA_256_GCM_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x59 );
sslv3_tls_ciphers['TLS_DH_anon_WITH_ARIA_128_GCM_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x5A );
sslv3_tls_ciphers['TLS_DH_anon_WITH_ARIA_256_GCM_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x5B );
sslv3_tls_ciphers['TLS_ECDHE_ECDSA_WITH_ARIA_128_GCM_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x5C );
sslv3_tls_ciphers['TLS_ECDHE_ECDSA_WITH_ARIA_256_GCM_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x5D );
sslv3_tls_ciphers['TLS_ECDH_ECDSA_WITH_ARIA_128_GCM_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x5E );
sslv3_tls_ciphers['TLS_ECDH_ECDSA_WITH_ARIA_256_GCM_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x5F );
sslv3_tls_ciphers['TLS_ECDHE_RSA_WITH_ARIA_128_GCM_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x60 );
sslv3_tls_ciphers['TLS_ECDHE_RSA_WITH_ARIA_256_GCM_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x61 );
sslv3_tls_ciphers['TLS_ECDH_RSA_WITH_ARIA_128_GCM_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x62 );
sslv3_tls_ciphers['TLS_ECDH_RSA_WITH_ARIA_256_GCM_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x63 );
sslv3_tls_ciphers['TLS_PSK_WITH_ARIA_128_CBC_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x64 );
sslv3_tls_ciphers['TLS_PSK_WITH_ARIA_256_CBC_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x65 );
sslv3_tls_ciphers['TLS_DHE_PSK_WITH_ARIA_128_CBC_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x66 );
sslv3_tls_ciphers['TLS_DHE_PSK_WITH_ARIA_256_CBC_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x67 );
sslv3_tls_ciphers['TLS_RSA_PSK_WITH_ARIA_128_CBC_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x68 );
sslv3_tls_ciphers['TLS_RSA_PSK_WITH_ARIA_256_CBC_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x69 );
sslv3_tls_ciphers['TLS_PSK_WITH_ARIA_128_GCM_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x6A );
sslv3_tls_ciphers['TLS_PSK_WITH_ARIA_256_GCM_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x6B );
sslv3_tls_ciphers['TLS_DHE_PSK_WITH_ARIA_128_GCM_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x6C );
sslv3_tls_ciphers['TLS_DHE_PSK_WITH_ARIA_256_GCM_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x6D );
sslv3_tls_ciphers['TLS_RSA_PSK_WITH_ARIA_128_GCM_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x6E );
sslv3_tls_ciphers['TLS_RSA_PSK_WITH_ARIA_256_GCM_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x6F );
sslv3_tls_ciphers['TLS_ECDHE_PSK_WITH_ARIA_128_CBC_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x70 );
sslv3_tls_ciphers['TLS_ECDHE_PSK_WITH_ARIA_256_CBC_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x71 );
sslv3_tls_ciphers['TLS_ECDHE_ECDSA_WITH_CAMELLIA_128_CBC_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x72 );
sslv3_tls_ciphers['TLS_ECDHE_ECDSA_WITH_CAMELLIA_256_CBC_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x73 );
sslv3_tls_ciphers['TLS_ECDH_ECDSA_WITH_CAMELLIA_128_CBC_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x74 );
sslv3_tls_ciphers['TLS_ECDH_ECDSA_WITH_CAMELLIA_256_CBC_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x75 );
sslv3_tls_ciphers['TLS_ECDHE_RSA_WITH_CAMELLIA_128_CBC_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x76 );
sslv3_tls_ciphers['TLS_ECDHE_RSA_WITH_CAMELLIA_256_CBC_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x77 );
sslv3_tls_ciphers['TLS_ECDH_RSA_WITH_CAMELLIA_128_CBC_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x78 );
sslv3_tls_ciphers['TLS_ECDH_RSA_WITH_CAMELLIA_256_CBC_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x79 );
sslv3_tls_ciphers['TLS_RSA_WITH_CAMELLIA_128_GCM_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x7A );
sslv3_tls_ciphers['TLS_RSA_WITH_CAMELLIA_256_GCM_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x7B );
sslv3_tls_ciphers['TLS_DHE_RSA_WITH_CAMELLIA_128_GCM_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x7C );
sslv3_tls_ciphers['TLS_DHE_RSA_WITH_CAMELLIA_256_GCM_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x7D );
sslv3_tls_ciphers['TLS_DH_RSA_WITH_CAMELLIA_128_GCM_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x7E );
sslv3_tls_ciphers['TLS_DH_RSA_WITH_CAMELLIA_256_GCM_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x7F );
sslv3_tls_ciphers['TLS_DHE_DSS_WITH_CAMELLIA_128_GCM_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x80 );
sslv3_tls_ciphers['TLS_DHE_DSS_WITH_CAMELLIA_256_GCM_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x81 );
sslv3_tls_ciphers['TLS_DH_DSS_WITH_CAMELLIA_128_GCM_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x82 );
sslv3_tls_ciphers['TLS_DH_DSS_WITH_CAMELLIA_256_GCM_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x83 );
sslv3_tls_ciphers['TLS_DH_anon_WITH_CAMELLIA_128_GCM_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x84 );
sslv3_tls_ciphers['TLS_DH_anon_WITH_CAMELLIA_256_GCM_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x85 );
sslv3_tls_ciphers['TLS_ECDHE_ECDSA_WITH_CAMELLIA_128_GCM_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x86 );
sslv3_tls_ciphers['TLS_ECDHE_ECDSA_WITH_CAMELLIA_256_GCM_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x87 );
sslv3_tls_ciphers['TLS_ECDH_ECDSA_WITH_CAMELLIA_128_GCM_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x88 );
sslv3_tls_ciphers['TLS_ECDH_ECDSA_WITH_CAMELLIA_256_GCM_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x89 );
sslv3_tls_ciphers['TLS_ECDHE_RSA_WITH_CAMELLIA_128_GCM_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x8A );
sslv3_tls_ciphers['TLS_ECDHE_RSA_WITH_CAMELLIA_256_GCM_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x8B );
sslv3_tls_ciphers['TLS_ECDH_RSA_WITH_CAMELLIA_128_GCM_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x8C );
sslv3_tls_ciphers['TLS_ECDH_RSA_WITH_CAMELLIA_256_GCM_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x8D );
sslv3_tls_ciphers['TLS_PSK_WITH_CAMELLIA_128_GCM_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x8E );
sslv3_tls_ciphers['TLS_PSK_WITH_CAMELLIA_256_GCM_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x8F );
sslv3_tls_ciphers['TLS_DHE_PSK_WITH_CAMELLIA_128_GCM_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x90 );
sslv3_tls_ciphers['TLS_DHE_PSK_WITH_CAMELLIA_256_GCM_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x91 );
sslv3_tls_ciphers['TLS_RSA_PSK_WITH_CAMELLIA_128_GCM_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x92 );
sslv3_tls_ciphers['TLS_RSA_PSK_WITH_CAMELLIA_256_GCM_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x93 );
sslv3_tls_ciphers['TLS_PSK_WITH_CAMELLIA_128_CBC_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x94 );
sslv3_tls_ciphers['TLS_PSK_WITH_CAMELLIA_256_CBC_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x95 );
sslv3_tls_ciphers['TLS_DHE_PSK_WITH_CAMELLIA_128_CBC_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x96 );
sslv3_tls_ciphers['TLS_DHE_PSK_WITH_CAMELLIA_256_CBC_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x97 );
sslv3_tls_ciphers['TLS_RSA_PSK_WITH_CAMELLIA_128_CBC_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x98 );
sslv3_tls_ciphers['TLS_RSA_PSK_WITH_CAMELLIA_256_CBC_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x99 );
sslv3_tls_ciphers['TLS_ECDHE_PSK_WITH_CAMELLIA_128_CBC_SHA256 : Medium cipher'] = raw_string( 0xC0, 0x9A );
sslv3_tls_ciphers['TLS_ECDHE_PSK_WITH_CAMELLIA_256_CBC_SHA384 : Medium cipher'] = raw_string( 0xC0, 0x9B );
sslv3_tls_ciphers['TLS_RSA_WITH_AES_128_CCM : Medium cipher'] = raw_string( 0xC0, 0x9C );
sslv3_tls_ciphers['TLS_RSA_WITH_AES_256_CCM : Medium cipher'] = raw_string( 0xC0, 0x9D );
sslv3_tls_ciphers['TLS_DHE_RSA_WITH_AES_128_CCM : Medium cipher'] = raw_string( 0xC0, 0x9E );
sslv3_tls_ciphers['TLS_DHE_RSA_WITH_AES_256_CCM : Medium cipher'] = raw_string( 0xC0, 0x9F );
sslv3_tls_ciphers['TLS_RSA_WITH_AES_128_CCM_8 : Medium cipher'] = raw_string( 0xC0, 0xA0 );
sslv3_tls_ciphers['TLS_RSA_WITH_AES_256_CCM_8 : Medium cipher'] = raw_string( 0xC0, 0xA1 );
sslv3_tls_ciphers['TLS_DHE_RSA_WITH_AES_128_CCM_8 : Medium cipher'] = raw_string( 0xC0, 0xA2 );
sslv3_tls_ciphers['TLS_DHE_RSA_WITH_AES_256_CCM_8 : Medium cipher'] = raw_string( 0xC0, 0xA3 );
sslv3_tls_ciphers['TLS_PSK_WITH_AES_128_CCM : Medium cipher'] = raw_string( 0xC0, 0xA4 );
sslv3_tls_ciphers['TLS_PSK_WITH_AES_256_CCM : Medium cipher'] = raw_string( 0xC0, 0xA5 );
sslv3_tls_ciphers['TLS_DHE_PSK_WITH_AES_128_CCM : Medium cipher'] = raw_string( 0xC0, 0xA6 );
sslv3_tls_ciphers['TLS_DHE_PSK_WITH_AES_256_CCM : Medium cipher'] = raw_string( 0xC0, 0xA7 );
sslv3_tls_ciphers['TLS_PSK_WITH_AES_128_CCM_8 : Medium cipher'] = raw_string( 0xC0, 0xA8 );
sslv3_tls_ciphers['TLS_PSK_WITH_AES_256_CCM_8 : Medium cipher'] = raw_string( 0xC0, 0xA9 );
sslv3_tls_ciphers['TLS_PSK_DHE_WITH_AES_128_CCM_8 : Medium cipher'] = raw_string( 0xC0, 0xAA );
sslv3_tls_ciphers['TLS_PSK_DHE_WITH_AES_256_CCM_8 : Medium cipher'] = raw_string( 0xC0, 0xAB );
sslv3_tls_ciphers['TLS_ECDHE_ECDSA_WITH_AES_128_CCM : Medium cipher'] = raw_string( 0xC0, 0xAC );
sslv3_tls_ciphers['TLS_ECDHE_ECDSA_WITH_AES_256_CCM : Medium cipher'] = raw_string( 0xC0, 0xAD );
sslv3_tls_ciphers['TLS_ECDHE_ECDSA_WITH_AES_128_CCM_8 : Medium cipher'] = raw_string( 0xC0, 0xAE );
sslv3_tls_ciphers['TLS_ECDHE_ECDSA_WITH_AES_256_CCM_8 : Medium cipher'] = raw_string( 0xC0, 0xAF );

## unassigned/reserved cipher codes for draft/temporary implementations & backward compatibility.
## Some servers might implement those.
sslv3_tls_ciphers['TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Draft) : Strong cipher'] = raw_string( 0xCC, 0x13 );
sslv3_tls_ciphers['TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256 (Draft) : Strong cipher'] = raw_string( 0xCC, 0x14 );
sslv3_tls_ciphers['TLS_DHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Draft) : Strong cipher'] = raw_string( 0xCC, 0x15 );

sslv3_tls_ciphers['TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 : Strong cipher'] = raw_string( 0xCC, 0xA8 );
sslv3_tls_ciphers['TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256 : Strong cipher'] = raw_string( 0xCC, 0xA9 );
sslv3_tls_ciphers['TLS_DHE_RSA_WITH_CHACHA20_POLY1305_SHA256 : Strong cipher'] = raw_string( 0xCC, 0xAA );
sslv3_tls_ciphers['TLS_PSK_WITH_CHACHA20_POLY1305_SHA256 : Strong cipher'] = raw_string( 0xCC, 0xAB );
sslv3_tls_ciphers['TLS_ECDHE_PSK_WITH_CHACHA20_POLY1305_SHA256 : Strong cipher'] = raw_string( 0xCC, 0xAC );
sslv3_tls_ciphers['TLS_DHE_PSK_WITH_CHACHA20_POLY1305_SHA256 : Strong cipher'] = raw_string( 0xCC, 0xAD );
sslv3_tls_ciphers['TLS_RSA_PSK_WITH_CHACHA20_POLY1305_SHA256 : Strong cipher'] = raw_string( 0xCC, 0xAE );

## unassigned/reserved cipher codes for draft/temporary implementations & backward compatibility.
## Some servers might implement those.
sslv3_tls_ciphers['TLS_RSA_WITH_ESTREAM_SALSA20_SHA1 (Draft) : Medium cipher'] = raw_string( 0xE4, 0x10 );
sslv3_tls_ciphers['TLS_RSA_WITH_SALSA20_SHA1 (Draft) : Medium cipher'] = raw_string( 0xE4, 0x11 );
sslv3_tls_ciphers['TLS_ECDHE_RSA_WITH_ESTREAM_SALSA20_SHA1 (Draft) : Medium cipher'] = raw_string( 0xE4, 0x12 );
sslv3_tls_ciphers['TLS_ECDHE_RSA_WITH_SALSA20_SHA1 (Draft) : Medium cipher'] = raw_string( 0xE4, 0x13 );
sslv3_tls_ciphers['TLS_ECDHE_ECDSA_WITH_ESTREAM_SALSA20_SHA1 (Draft) : Medium cipher'] = raw_string( 0xE4, 0x14 );
sslv3_tls_ciphers['TLS_ECDHE_ECDSA_WITH_SALSA20_SHA1 (Draft) : Medium cipher'] = raw_string( 0xE4, 0x15 );
sslv3_tls_ciphers['TLS_PSK_WITH_ESTREAM_SALSA20_SHA1 (Draft) : Medium cipher'] = raw_string( 0xE4, 0x16 );
sslv3_tls_ciphers['TLS_PSK_WITH_SALSA20_SHA1 (Draft) : Medium cipher'] = raw_string( 0xE4, 0x17 );
sslv3_tls_ciphers['TLS_ECDHE_PSK_WITH_ESTREAM_SALSA20_SHA1 (Draft) : Medium cipher'] = raw_string( 0xE4, 0x18 );
sslv3_tls_ciphers['TLS_ECDHE_PSK_WITH_SALSA20_SHA1 (Draft) : Medium cipher'] = raw_string( 0xE4, 0x19 );
sslv3_tls_ciphers['TLS_RSA_PSK_WITH_ESTREAM_SALSA20_SHA1 (Draft) : Medium cipher'] = raw_string( 0xE4, 0x1A );
sslv3_tls_ciphers['TLS_RSA_PSK_WITH_SALSA20_SHA1 (Draft) : Medium cipher'] = raw_string( 0xE4, 0x1B );
sslv3_tls_ciphers['TLS_DHE_PSK_WITH_ESTREAM_SALSA20_SHA1 (Draft) : Medium cipher'] = raw_string( 0xE4, 0x1C );
sslv3_tls_ciphers['TLS_DHE_PSK_WITH_SALSA20_SHA1 (Draft) : Medium cipher'] = raw_string( 0xE4, 0x1D );
sslv3_tls_ciphers['TLS_DHE_RSA_WITH_ESTREAM_SALSA20_SHA1 (Draft) : Medium cipher'] = raw_string( 0xE4, 0x1E );
sslv3_tls_ciphers['TLS_DHE_RSA_WITH_SALSA20_SHA1 (Draft) : Medium cipher'] = raw_string( 0xE4, 0x1F );
sslv3_tls_ciphers['TLS_RSA_FIPS_WITH_DES_CBC_SHA (Draft) : Medium cipher'] = raw_string( 0xFE, 0xFE );
sslv3_tls_ciphers['TLS_RSA_FIPS_WITH_3DES_EDE_CBC_SHA (Draft) : Medium cipher'] = raw_string( 0xFE, 0xFF );
sslv3_tls_ciphers['TLS_RSA_FIPS_WITH_3DES_EDE_CBC_SHA_2 (Draft) : Medium cipher'] = raw_string( 0xFF, 0xE0 );
sslv3_tls_ciphers['TLS_RSA_FIPS_WITH_DES_CBC_SHA_2 (Draft) : Medium cipher'] = raw_string( 0xFF, 0xE1 );
sslv3_tls_ciphers['TLS_RSA_WITH_RC2_CBC_MD5 (Draft) : Weak cipher'] = raw_string( 0xFF, 0x80 );
sslv3_tls_ciphers['TLS_RSA_WITH_IDEA_CBC_MD5 (Draft) : Weak cipher'] = raw_string( 0xFF, 0x81 );
sslv3_tls_ciphers['TLS_RSA_WITH_DES_CBC_MD5 (Draft) : Medium cipher'] = raw_string( 0xFF, 0x82 );
sslv3_tls_ciphers['TLS_RSA_WITH_3DES_EDE_CBC_MD5 (Draft) : Medium cipher'] = raw_string( 0xFF, 0x83 );

cipher_arrays = make_list( keys( sslv3_tls_ciphers ) );

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.900238");
  script_version("$Revision: 11665 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-28 09:14:18 +0200 (Fri, 28 Sep 2018) $");
  script_tag(name:"creation_date", value:"2010-04-16 11:02:50 +0200 (Fri, 16 Apr 2010)");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("SSL/TLS: Cipher Settings");
  script_category(ACT_SETTINGS);
  script_copyright("Copyright (C) 2010 SecPod");
  script_family("SSL and TLS");

  foreach c ( keys( cipher_arrays ) )
  {
    v = FALSE;

    n = split( cipher_arrays[c], sep:" : ", keep:FALSE );
    if( isnull( n[0] ) || isnull( n[1] ) ) continue;

    if( "Weak cipher" >< n[1] )
      v = "Weak cipher;Null cipher;Medium cipher;Strong cipher";

    else if( "Null cipher" >< n[1] )
      v = "Null cipher;Weak cipher;Medium cipher;Strong cipher";

    else if( "Medium cipher" >< n[1] )
      v = "Medium cipher;Null cipher;Weak cipher;Strong cipher";

    else if( "Strong cipher" >< n[1] )
      v = "Strong cipher;Null cipher;Weak cipher;Medium cipher";

    else
      continue;

    if( v )
  script_add_preference(name:n[0], type:"radio", value:v);
  }

  script_tag(name:"summary", value:"This plugin Set SSL Cipher Settings.

  This plugin will gets the ssl cipher settings from user preference and
  sets into the KB.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

foreach c( keys( cipher_arrays ) ) {

  n = split( cipher_arrays[c], sep:" : ", keep:FALSE );
  if( isnull( n[0] ) || isnull( n[1] ) ) continue;

  v = script_get_preference( n[0] );
  if( ! v ) continue;

  if( v >!< n[1] )
    set_kb_item( name:'ssl/ciphers/override/' + n[0] + ' : ' + n[1], value: v );
}
