# Ver 1.1.0

#### Usage

* `$ ruby main.rb`

* For translating VGMdb tracklist purpose

* Change format, input/output file in `config.yml` to use

* Use dash `-` in lang file to skip translating tracks

#### Notes

* Input tracklist and language tracklist must have same size (number of tracks)

#### Examples

* Config: `config.yml`

* Input: `input/lang.txt`, `input/tracklist.txt`

* Output: `output/tracklist.txt`

#### Changelog

###### 1.1.0
* Raise error when input tracklists do not match together
* Skip translating specific tracks
