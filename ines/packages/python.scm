(define-module (ines packages python)
 #:use-module ((guix licenses) #:prefix license:)
 #:use-module (guix download)
 #:use-module (guix git-download)
 #:use-module (guix packages)
 #:use-module (guix build-system python)
 #:use-module (guix build-system pyproject)
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

(define-public python-smbus2
  (package
    (name "python-smbus2")
    (version "0.4.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "smbus2" version))
       (sha256
        (base32
         "0fl0dazyg78yqz4lljd252kva3l8ip4lw95jlyvkqdhsis52iwin"))))
    (build-system python-build-system)
    (home-page "https://github.com/kplindegaard/smbus2")
    (synopsis "Drop-in replacement for smbus-cffi/smbus-python in pure Python")
    (description "This package provides a Python library to access
@acronym{I2C, Inter-Integrated Circuit} and @acronym{SMBus, System +
Management Bus} devices on Linux.  It is functionally equivalent to
python-smbus and provides the same interface and syntax.")
    (license license:expat)))

(define-public python-keyboard
  (package
    (name "python-keyboard")
    (version "0.13.5")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/boppreh/keyboard")
            (commit (string-append "v" version))))
       (sha256
        (base32
         "0lzn15xxh35ixw77d3hg3lmlxry69cdgfrvj2g0srwbnza29d0ak"))))
    (arguments '(#:tests? #f ;; no test target
                 ))
    (build-system pyproject-build-system)
    (home-page "https://github.com/boppreh/keyboard")
    (synopsis "KEYBOARD")
    (description "TODO")
    (license license:expat)))
