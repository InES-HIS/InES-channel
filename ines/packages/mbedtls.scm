(define-module (ines packages mbedtls)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system cmake)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages python))

(define-public mbedtls-apache3
  (package
    (name "mbedtls-apache3")
    ;; XXX Check whether ‘-Wformat-signedness’ still breaks mbedtls-for-hiawatha
    ;; when updating.
    (version "3.2.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ARMmbed/mbedtls")
             (commit (string-append "mbedtls-" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1dvj1m2i5lkaf8bcmslap8d82z2pi7ypgr8n7lv0rqjyy4vgmkgq"))))
    (build-system cmake-build-system)
    (arguments
     `(#:configure-flags
       (list "-DUSE_SHARED_MBEDTLS_LIBRARY=ON"
             "-DUSE_STATIC_MBEDTLS_LIBRARY=OFF")
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'make-source-writable
           (lambda _
             (for-each make-file-writable (find-files ".")))))))
    (native-inputs
     (list perl python))
    (synopsis "Small TLS library")
    (description
     "@code{mbed TLS}, formerly known as PolarSSL, makes it trivially easy
for developers to include cryptographic and SSL/TLS capabilities in their
(embedded) products, facilitating this functionality with a minimal
coding footprint.")
    (home-page "https://www.trustedfirmware.org/projects/mbed-tls/")
    (license license:asl2.0)))
