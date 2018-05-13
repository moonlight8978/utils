# Ver 1.3.0

#### Usage

* `./translate.rb [options]`

  * `-s --src`: Path to input tracklist (original language). Default: `input/tracklist.txt`

  * `-l --lang`: Path to language tracklist. Default `input/lang.txt`

  * `-i --lang-id`: Language tracklist format. Default: `n`

  * `-o --out`: Output tracklist (translated one). Default: ``output/tracklist.txt`

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

* Run: `$ ./translate.rb -i`

#### Changelog

###### 1.4.0
* Length is automatically parsed from line
* Change command-line parameters name

###### 1.3.0
* Support 'in' input tracklist

###### 1.2.0
* Logger
* Config via parameters

###### 1.1.0
* Raise error when input tracklists do not match together
* Skip translating specific tracks
