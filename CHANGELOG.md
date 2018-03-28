# Changelog

All notable changes to this project will be documented in this file.
Each new release typically also includes the latest modulesync defaults.
These should not affect the functionality of the module.

## [v3.2.0](https://github.com/voxpupuli/puppet-staging/tree/v3.2.0) (2018-03-28)

[Full Changelog](https://github.com/voxpupuli/puppet-staging/compare/v3.1.0...v3.2.0)

**Implemented enhancements:**

- Add novalidate option to bypass https validation for powershell [\#134](https://github.com/voxpupuli/puppet-staging/pull/134) ([esalberg](https://github.com/esalberg))
- add support for 7zip [\#132](https://github.com/voxpupuli/puppet-staging/pull/132) ([FunFR](https://github.com/FunFR))

**Merged pull requests:**

- bump puppet to latest supported version 4.10.0 [\#156](https://github.com/voxpupuli/puppet-staging/pull/156) ([bastelfreak](https://github.com/bastelfreak))

## [v3.1.0](https://github.com/voxpupuli/puppet-staging/tree/v3.1.0) (2018-01-03)

[Full Changelog](https://github.com/voxpupuli/puppet-staging/compare/v3.0.0...v3.1.0)

**Implemented enhancements:**

- Add untar\_opts parameter for extract [\#151](https://github.com/voxpupuli/puppet-staging/pull/151) ([ardichoke](https://github.com/ardichoke))
- declare compatible with Puppet 5.x [\#150](https://github.com/voxpupuli/puppet-staging/pull/150) ([mmoll](https://github.com/mmoll))

**Closed issues:**

- Add an opts parameter for tar [\#142](https://github.com/voxpupuli/puppet-staging/issues/142)

## [v3.0.0](https://github.com/voxpupuli/puppet-staging/tree/v3.0.0) (2017-11-13)

[Full Changelog](https://github.com/voxpupuli/puppet-staging/compare/v2.2.0...v3.0.0)

**Implemented enhancements:**

- Set owner, group, mode explicitly so things work even with umask 027. [\#144](https://github.com/voxpupuli/puppet-staging/pull/144) ([stefanbethke](https://github.com/stefanbethke))

**Closed issues:**

- Add deprecation notice to README [\#116](https://github.com/voxpupuli/puppet-staging/issues/116)

**Merged pull requests:**

- Solaris 12 is now Solaris 11.4 [\#145](https://github.com/voxpupuli/puppet-staging/pull/145) ([shawnferry](https://github.com/shawnferry))
- Fix github license detection [\#141](https://github.com/voxpupuli/puppet-staging/pull/141) ([alexjfisher](https://github.com/alexjfisher))
- Fix puppet:/// URLS [\#139](https://github.com/voxpupuli/puppet-staging/pull/139) ([alexjfisher](https://github.com/alexjfisher))
- Deprecate module [\#137](https://github.com/voxpupuli/puppet-staging/pull/137) ([alexjfisher](https://github.com/alexjfisher))

## [v2.2.0](https://github.com/voxpupuli/puppet-staging/tree/v2.2.0) (2017-02-11)

[Full Changelog](https://github.com/voxpupuli/puppet-staging/compare/v2.1.0...v2.2.0)

**Merged pull requests:**

- release 2.1.0; last release with puppet3 support! [\#131](https://github.com/voxpupuli/puppet-staging/pull/131) ([bastelfreak](https://github.com/bastelfreak))

## [v2.1.0](https://github.com/voxpupuli/puppet-staging/tree/v2.1.0) (2016-12-26)

[Full Changelog](https://github.com/voxpupuli/puppet-staging/compare/v2.0.1...v2.1.0)

**Closed issues:**

- Duplicate resource declaration [\#109](https://github.com/voxpupuli/puppet-staging/issues/109)
- Syntax error in staging\_windir.rb [\#102](https://github.com/voxpupuli/puppet-staging/issues/102)

**Merged pull requests:**

- Bump puppet minimum version\_requirement to 3.8.7 [\#129](https://github.com/voxpupuli/puppet-staging/pull/129) ([juniorsysadmin](https://github.com/juniorsysadmin))
- Add missing badges [\#123](https://github.com/voxpupuli/puppet-staging/pull/123) ([dhoppe](https://github.com/dhoppe))
- Strip trailing slashes off paths [\#115](https://github.com/voxpupuli/puppet-staging/pull/115) ([alexjfisher](https://github.com/alexjfisher))
- Remove Vagrantfile [\#110](https://github.com/voxpupuli/puppet-staging/pull/110) ([juniorsysadmin](https://github.com/juniorsysadmin))
- Ability to manage file attributes on target [\#86](https://github.com/voxpupuli/puppet-staging/pull/86) ([samuelson](https://github.com/samuelson))

## [v2.0.1](https://github.com/voxpupuli/puppet-staging/tree/v2.0.1) (2016-08-31)

[Full Changelog](https://github.com/voxpupuli/puppet-staging/compare/v1.0.7...v2.0.1)

**Closed issues:**

- Failure to set '::staging::path' [\#107](https://github.com/voxpupuli/puppet-staging/issues/107)

**Merged pull requests:**

- Fix some typos/spelling [\#103](https://github.com/voxpupuli/puppet-staging/pull/103) ([alexjfisher](https://github.com/alexjfisher))
- Remove old version warnings [\#101](https://github.com/voxpupuli/puppet-staging/pull/101) ([rnelson0](https://github.com/rnelson0))

## [v1.0.7](https://github.com/voxpupuli/puppet-staging/tree/v1.0.7) (2016-06-10)

[Full Changelog](https://github.com/voxpupuli/puppet-staging/compare/v2.0.0...v1.0.7)

**Merged pull requests:**

- Release 1.0.7 [\#100](https://github.com/voxpupuli/puppet-staging/pull/100) ([bastelfreak](https://github.com/bastelfreak))

## [v2.0.0](https://github.com/voxpupuli/puppet-staging/tree/v2.0.0) (2016-06-10)

[Full Changelog](https://github.com/voxpupuli/puppet-staging/compare/v1.0.6...v2.0.0)

**Closed issues:**

- JSON syntax in staging\_windir fact causes syntax error using Ruby 1.8 [\#96](https://github.com/voxpupuli/puppet-staging/issues/96)
- Error loading staging\_windir.rb [\#94](https://github.com/voxpupuli/puppet-staging/issues/94)
- Release to puppet-community namespace on forge [\#84](https://github.com/voxpupuli/puppet-staging/issues/84)
- File source using https with username/password fails with certain password character sequences [\#79](https://github.com/voxpupuli/puppet-staging/issues/79)
- Puppet 4 support [\#67](https://github.com/voxpupuli/puppet-staging/issues/67)
- ".gz" files are not supported [\#47](https://github.com/voxpupuli/puppet-staging/issues/47)

**Merged pull requests:**

- Add support for OpenBSD, very similar to FreeBSD. [\#87](https://github.com/voxpupuli/puppet-staging/pull/87) ([buzzdeee](https://github.com/buzzdeee))
- Pass full path as name in staging::deploy [\#78](https://github.com/voxpupuli/puppet-staging/pull/78) ([Cinderhaze](https://github.com/Cinderhaze))

## [v1.0.6](https://github.com/voxpupuli/puppet-staging/tree/v1.0.6) (2016-03-20)

[Full Changelog](https://github.com/voxpupuli/puppet-staging/compare/v1.0.5...v1.0.6)

**Merged pull requests:**

- Release v1.0.6 [\#93](https://github.com/voxpupuli/puppet-staging/pull/93) ([rnelson0](https://github.com/rnelson0))

## [v1.0.5](https://github.com/voxpupuli/puppet-staging/tree/v1.0.5) (2016-03-19)

[Full Changelog](https://github.com/voxpupuli/puppet-staging/compare/v1.0.4...v1.0.5)

**Merged pull requests:**

- Release v1.0.5 [\#92](https://github.com/voxpupuli/puppet-staging/pull/92) ([rnelson0](https://github.com/rnelson0))

## [v1.0.4](https://github.com/voxpupuli/puppet-staging/tree/v1.0.4) (2016-03-19)

[Full Changelog](https://github.com/voxpupuli/puppet-staging/compare/1.0.4...v1.0.4)

**Closed issues:**

- Ability to validate checksum and/or file size of archive [\#82](https://github.com/voxpupuli/puppet-staging/issues/82)
- unzip should use -o -f always or optionally [\#81](https://github.com/voxpupuli/puppet-staging/issues/81)
- Staging Deploy to take strip parameter [\#62](https://github.com/voxpupuli/puppet-staging/issues/62)
- staging extract with rename [\#61](https://github.com/voxpupuli/puppet-staging/issues/61)
- Variable $path not correctly scoped [\#59](https://github.com/voxpupuli/puppet-staging/issues/59)
- Remove staged file after deploy [\#58](https://github.com/voxpupuli/puppet-staging/issues/58)

**Merged pull requests:**

- Fix da badge [\#90](https://github.com/voxpupuli/puppet-staging/pull/90) ([rnelson0](https://github.com/rnelson0))
- Add support for unzip options [\#83](https://github.com/voxpupuli/puppet-staging/pull/83) ([mkrakowitzer](https://github.com/mkrakowitzer))
- Wrap http credentials with quotes [\#80](https://github.com/voxpupuli/puppet-staging/pull/80) ([bcornies](https://github.com/bcornies))
- added .Z archive handling [\#76](https://github.com/voxpupuli/puppet-staging/pull/76) ([vchepkov](https://github.com/vchepkov))
- "Puppet-communityfy the readme" [\#75](https://github.com/voxpupuli/puppet-staging/pull/75) ([nibalizer](https://github.com/nibalizer))
- Fix linting errors [\#74](https://github.com/voxpupuli/puppet-staging/pull/74) ([nibalizer](https://github.com/nibalizer))
- Error parsing this YAML file. [\#73](https://github.com/voxpupuli/puppet-staging/pull/73) ([klynton](https://github.com/klynton))
- Add support for .deb archives. [\#71](https://github.com/voxpupuli/puppet-staging/pull/71) ([aswen](https://github.com/aswen))
- Add support for tbz2 filetype \(same as tar.bz2\). [\#70](https://github.com/voxpupuli/puppet-staging/pull/70) ([aswen](https://github.com/aswen))
- Add future parser and remove puppet 4 restrictions. [\#68](https://github.com/voxpupuli/puppet-staging/pull/68) ([nanliu](https://github.com/nanliu))
- Added quotes around source and target for powershell downloads [\#66](https://github.com/voxpupuli/puppet-staging/pull/66) ([csykora](https://github.com/csykora))
- Fix for powershell download failing [\#65](https://github.com/voxpupuli/puppet-staging/pull/65) ([csykora](https://github.com/csykora))
- Expose strip parameter to the staging::deploy defined type  [\#63](https://github.com/voxpupuli/puppet-staging/pull/63) ([adamjk-dev](https://github.com/adamjk-dev))

## [1.0.4](https://github.com/voxpupuli/puppet-staging/tree/1.0.4) (2015-01-29)

[Full Changelog](https://github.com/voxpupuli/puppet-staging/compare/1.0.3...1.0.4)

**Closed issues:**

- conflict when using module with latest pe [\#56](https://github.com/voxpupuli/puppet-staging/issues/56)

**Merged pull requests:**

- Support windows local files. [\#57](https://github.com/voxpupuli/puppet-staging/pull/57) ([nanliu](https://github.com/nanliu))
- Release 1.0.3 [\#55](https://github.com/voxpupuli/puppet-staging/pull/55) ([nanliu](https://github.com/nanliu))

## [1.0.3](https://github.com/voxpupuli/puppet-staging/tree/1.0.3) (2015-01-16)

[Full Changelog](https://github.com/voxpupuli/puppet-staging/compare/1.0.2...1.0.3)

**Closed issues:**

- staging::file when specifying $target not behaving as documented [\#51](https://github.com/voxpupuli/puppet-staging/issues/51)
- FreeBSD doesn't have /opt by default [\#49](https://github.com/voxpupuli/puppet-staging/issues/49)
- New Release [\#45](https://github.com/voxpupuli/puppet-staging/issues/45)

**Merged pull requests:**

- Update staging::file documentation. [\#54](https://github.com/voxpupuli/puppet-staging/pull/54) ([nanliu](https://github.com/nanliu))
- Check for powershell first to avoid aliases for curl & wget [\#53](https://github.com/voxpupuli/puppet-staging/pull/53) ([samuelson](https://github.com/samuelson))
- Add retries for the file transfer [\#52](https://github.com/voxpupuli/puppet-staging/pull/52) ([bogdando](https://github.com/bogdando))
- -- Adding support for FreeBSD [\#50](https://github.com/voxpupuli/puppet-staging/pull/50) ([madelaney](https://github.com/madelaney))
- Update metadata.json [\#48](https://github.com/voxpupuli/puppet-staging/pull/48) ([kgeis](https://github.com/kgeis))

## [1.0.2](https://github.com/voxpupuli/puppet-staging/tree/1.0.2) (2014-10-27)

[Full Changelog](https://github.com/voxpupuli/puppet-staging/compare/1.0.1...1.0.2)

**Merged pull requests:**

- Update Gemfile and rake test [\#46](https://github.com/voxpupuli/puppet-staging/pull/46) ([nanliu](https://github.com/nanliu))
- Fix for strict variables support [\#43](https://github.com/voxpupuli/puppet-staging/pull/43) ([underscorgan](https://github.com/underscorgan))

## [1.0.1](https://github.com/voxpupuli/puppet-staging/tree/1.0.1) (2014-09-11)

[Full Changelog](https://github.com/voxpupuli/puppet-staging/compare/1.0.0...1.0.1)

**Merged pull requests:**

- \(ENTERPISE-258\) Fix conflict with pe\_staging. [\#38](https://github.com/voxpupuli/puppet-staging/pull/38) ([nanliu](https://github.com/nanliu))

## [1.0.0](https://github.com/voxpupuli/puppet-staging/tree/1.0.0) (2014-09-09)

[Full Changelog](https://github.com/voxpupuli/puppet-staging/compare/0.4.1...1.0.0)

**Closed issues:**

- some download error handling... [\#37](https://github.com/voxpupuli/puppet-staging/issues/37)
- New Release? [\#32](https://github.com/voxpupuli/puppet-staging/issues/32)

**Merged pull requests:**

- s3 support [\#39](https://github.com/voxpupuli/puppet-staging/pull/39) ([epelletier](https://github.com/epelletier))
- Release 0.4.1 for forge. [\#36](https://github.com/voxpupuli/puppet-staging/pull/36) ([nanliu](https://github.com/nanliu))

## [0.4.1](https://github.com/voxpupuli/puppet-staging/tree/0.4.1) (2014-07-01)

[Full Changelog](https://github.com/voxpupuli/puppet-staging/compare/0.4.0...0.4.1)

**Closed issues:**

- module fails to find wget [\#28](https://github.com/voxpupuli/puppet-staging/issues/28)
- staging doesn't work on puppet 2.7 on windows [\#26](https://github.com/voxpupuli/puppet-staging/issues/26)

**Merged pull requests:**

- Update gitignore and readme example. [\#34](https://github.com/voxpupuli/puppet-staging/pull/34) ([nanliu](https://github.com/nanliu))
- On Windows, use well-known SIDs to set ownership [\#33](https://github.com/voxpupuli/puppet-staging/pull/33) ([nanliu](https://github.com/nanliu))
- Fix/strict variables [\#31](https://github.com/voxpupuli/puppet-staging/pull/31) ([mcanevet](https://github.com/mcanevet))
- Add support for GNU tar's --strip option. [\#30](https://github.com/voxpupuli/puppet-staging/pull/30) ([underscorgan](https://github.com/underscorgan))
- fix typo in error message [\#27](https://github.com/voxpupuli/puppet-staging/pull/27) ([justinclayton](https://github.com/justinclayton))
- Homogenize path-separator in staging\_parse [\#25](https://github.com/voxpupuli/puppet-staging/pull/25) ([reidmv](https://github.com/reidmv))
- Use $target\_file in \*\_get variables, not $name [\#24](https://github.com/voxpupuli/puppet-staging/pull/24) ([reidmv](https://github.com/reidmv))

## [0.4.0](https://github.com/voxpupuli/puppet-staging/tree/0.4.0) (2014-02-20)

[Full Changelog](https://github.com/voxpupuli/puppet-staging/compare/0.3.1...0.4.0)

**Closed issues:**

- Ability to replace an extracted directory with a new version [\#20](https://github.com/voxpupuli/puppet-staging/issues/20)
- Fetching a URL with query parameters fails [\#13](https://github.com/voxpupuli/puppet-staging/issues/13)

**Merged pull requests:**

- Add support for .tar.bz2 archives to extract [\#22](https://github.com/voxpupuli/puppet-staging/pull/22) ([gizero](https://github.com/gizero))
- Add /usr/sfw/bin to the solaris path [\#21](https://github.com/voxpupuli/puppet-staging/pull/21) ([reidmv](https://github.com/reidmv))
- Add Powershell support for Windows [\#19](https://github.com/voxpupuli/puppet-staging/pull/19) ([nanliu](https://github.com/nanliu))
- Update spec testing. [\#18](https://github.com/voxpupuli/puppet-staging/pull/18) ([nanliu](https://github.com/nanliu))
- Handle URLs with parameters more sensibly. [\#15](https://github.com/voxpupuli/puppet-staging/pull/15) ([ojacobson](https://github.com/ojacobson))

## [0.3.1](https://github.com/voxpupuli/puppet-staging/tree/0.3.1) (2013-07-03)

[Full Changelog](https://github.com/voxpupuli/puppet-staging/compare/0.3.0...0.3.1)

**Merged pull requests:**

- Update testing for Puppet 3 [\#12](https://github.com/voxpupuli/puppet-staging/pull/12) ([nanliu](https://github.com/nanliu))
- \[staging\_parse\] Raise error if given invalid source [\#11](https://github.com/voxpupuli/puppet-staging/pull/11) ([adrienthebo](https://github.com/adrienthebo))
- Support for extracting jar files. [\#10](https://github.com/voxpupuli/puppet-staging/pull/10) ([haraldsk](https://github.com/haraldsk))

## [0.3.0](https://github.com/voxpupuli/puppet-staging/tree/0.3.0) (2013-05-07)

[Full Changelog](https://github.com/voxpupuli/puppet-staging/compare/0.2.1...0.3.0)

**Closed issues:**

- Modulefile 'name' property should be 'nanliu-staging' [\#5](https://github.com/voxpupuli/puppet-staging/issues/5)

**Merged pull requests:**

- Feature wget [\#8](https://github.com/voxpupuli/puppet-staging/pull/8) ([reidmv](https://github.com/reidmv))
- Make curl error on 404 [\#7](https://github.com/voxpupuli/puppet-staging/pull/7) ([hunner](https://github.com/hunner))
- Username and password support for http [\#6](https://github.com/voxpupuli/puppet-staging/pull/6) ([haraldsk](https://github.com/haraldsk))

## [0.2.1](https://github.com/voxpupuli/puppet-staging/tree/0.2.1) (2012-11-21)

[Full Changelog](https://github.com/voxpupuli/puppet-staging/compare/0.2.0...0.2.1)

## [0.2.0](https://github.com/voxpupuli/puppet-staging/tree/0.2.0) (2012-09-09)

[Full Changelog](https://github.com/voxpupuli/puppet-staging/compare/0.1.0...0.2.0)

**Closed issues:**

- Does puppet-staging work in standalone mode? [\#3](https://github.com/voxpupuli/puppet-staging/issues/3)
- file define forces a default path for Exec [\#2](https://github.com/voxpupuli/puppet-staging/issues/2)

**Merged pull requests:**

- Display output on fail for execs in deploy::file [\#4](https://github.com/voxpupuli/puppet-staging/pull/4) ([adrienthebo](https://github.com/adrienthebo))

## [0.1.0](https://github.com/voxpupuli/puppet-staging/tree/0.1.0) (2012-02-27)

[Full Changelog](https://github.com/voxpupuli/puppet-staging/compare/b87343a19c387e2d74c8fa2e71987488e80a4d8a...0.1.0)

**Merged pull requests:**

- Add timeout to deploy and file defines [\#1](https://github.com/voxpupuli/puppet-staging/pull/1) ([adrienthebo](https://github.com/adrienthebo))



\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/skywinder/Github-Changelog-Generator)*
