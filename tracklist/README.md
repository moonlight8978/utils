# Ver 1.2.0

#### Usage

* `./translate.rb [options]`

  * `--in`: Input tracklist (original language)

  * `--lang`: Language tracklist

  * `--format`: Language tracklist format

  * `--out`: Output tracklist (translated one)

* For translating VGMdb tracklist purpose

* Customizable via `config.yml` or command-line parameters

* Use dash `-` in lang file to skip translating tracks

#### Notes

* Input tracklist and language tracklist must have same size (number of tracks)

* Command-line parameter(s) has higher priority

#### Examples

* Config: `config.yml`

* Input: `input/lang.txt`, `input/tracklist.txt`

* Output: `output/tracklist.txt`

#### Changelog

###### 1.2.0
* Logger
* Config via parameters

###### 1.1.0
* Raise error when input tracklists do not match together
* Skip translating specific tracks
