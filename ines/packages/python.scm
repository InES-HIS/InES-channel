(define-module (ines packages python)
 #:use-module ((guix licenses) #:prefix license:)
 #:use-module (guix packages)
 #:use-module (guix download)
 #:use-module (guix git-download)
 #:use-module (guix build-system python)
 #:use-module (gnu packages python-xyz))

(define-public python-icmplib
  (package
    (name "python-icmplib")
    (version "3.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "icmplib" version))
       (sha256
        (base32 "1yssh1bsymlcwmvfag47wg1x9axl6i0zwzywxv1abzz0ndmdmyz4"))))
    (arguments
     '(#:tests? #f)) ;test data not present
    (build-system python-build-system)
    (home-page "https://github.com/ValentinBELYN/icmplib")
    (synopsis
     "Python implementation of the Internet Control Message Protocol (ICMP)")
    (description
     "@code{icmplib} is a supporting library for both IPv4 and IPv6 networks.
ICMP is typically used for diagnostic or control purposes - well known from
utilities such as ping(1).")
    (license license:lgpl3)))

(define-public python-scapy-secure-handshake
  (package
   (inherit python-scapy)
   (name "python-scapy-secure-handshake")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/InES-HIS/python-scapy-pnio-sec")
           (commit "PN-secure-handshake")))
     (sha256
      (base32 "1i27y9bpw40kw20lcxf44fn9mgkih79923rhn26g2q8hypw3a7fd"))))))
