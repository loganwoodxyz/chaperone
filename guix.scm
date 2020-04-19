;    Copyright (C) 2020 Steffen Rytter Postas <nc@scalehost.eu>
;    This program is free software: you can redistribute it and/or modify
;    it under the terms of the GNU General Public License as published by
;    the Free Software Foundation, either version 3 of the License, or
;    (at your option) any later version.
;
;    This program is distributed in the hope that it will be useful,
;    but WITHOUT ANY WARRANTY; without even the implied warranty of
;    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;    GNU General Public License for more details.
;
;    You should have received a copy of the GNU General Public License
;    along with this program.  If not, see <https://www.gnu.org/licenses/>.

(define-module (gnu packages chaperone)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages time)
  #:use-module (gnu packages check))

(define-public python-voluptuous
  (package
  (name "python-voluptuous")
  (version "0.11.7")
  (source
    (origin
      (method url-fetch)
      (uri (pypi-uri "voluptuous" version))
      (sha256
        (base32
          "0mplkcpb5d8wjf8vk195fys4y6a3wbibiyf708imw33lphfk9g1a"))))
  (build-system python-build-system)
  (native-inputs
   `(
     ("python-nose", python-nose)
     ))
  (home-page
    "https://github.com/alecthomas/voluptuous")
  (synopsis
    "# Voluptuous is a Python data validation library")
  (description
    "# Voluptuous is a Python data validation library")
  (license license:bsd-3)))

(define-public python-croniter
  (package
  (name "python-croniter")
  (version "0.3.31")
  (source
    (origin
      (method url-fetch)
      (uri (pypi-uri "croniter" version))
      (sha256
        (base32
          "15riw8sl8jzzkvvjlz3i3p7jcx423zipxhff5ddvki6zgnrb9149"))))
  (build-system python-build-system)
  (propagated-inputs
    `(("python-dateutil" ,python-dateutil)))
  (home-page "http://github.com/kiorky/croniter")
  (synopsis
    "croniter provides iteration for datetime object with cron like format")
  (description
    "croniter provides iteration for datetime object with cron like format")
  (license #f)))

(define-public python-aiocron
  (package
  (name "python-aiocron")
  (version "1.3")
  (source
    (origin
      (method url-fetch)
      (uri (pypi-uri "aiocron" version))
      (sha256
        (base32
          "17763gakhy71mcjwrzwslvgyd59pdrr3iw0lcwh9b1mibcxk8z3z"))))
  (build-system python-build-system)
  (propagated-inputs
    `(("python-croniter" ,python-croniter)
      ("python-tzlocal" ,python-tzlocal)))
  (native-inputs
   `(
     ("python-coverage" ,python-coverage)
     ("python-pytest", python-pytest)))
  (home-page "https://github.com/gawel/aiocron/")
  (synopsis "Crontabs for asyncio")
  (description "Crontabs for asyncio")
  (license license:expat)))

(define-public python-chaperone
  (let ((commit "b3345827fdf754db3423814cedc0d4f55382a7d2")
        (revision "0"))
  (package
   (name "python-chaperone")
   (version (git-version "0.3.2" revision commit))
   (source (origin
            (method git-fetch)
            (uri (git-reference
                  (url "https://git.scl.one/necrophcodr/chaperone")
                  (commit commit)))
           (sha256
            (base32
             "0yaahragd8j3w674p9505zv943q000ik6fy7h1fgva7dxybashrv"))))
   (build-system python-build-system)
   (native-inputs
    `(
      ("python-setproctitle", python-setproctitle)
      ("python-aiocron", python-aiocron)
      ("python-voluptuous", python-voluptuous)
      ("python-pyyaml", python-pyyaml)
      ("python-docopt", python-docopt)
      ))
   (synopsis "")
   (description "")
   (home-page "")
   (license license:asl2.0))))
