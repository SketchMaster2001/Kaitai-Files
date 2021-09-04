meta:
  id: mii_list
  title: Posting Plaza Mii List
  file-extension:
    - ces
    - dec
  application: Check Mii Out Channel
  endian: be
seq:
  - id: header
    type: header
  - id: number
    type: number
    doc: Mii number.
  - id: mii_data
    type: mii_data
    repeat: expr
    repeat-expr: number.mii_count
types:
  header:
    seq:
      - id: type
        type: str
        size: 2
        encoding: ascii
      - id: padding1
        size: 2
      - id: country_code
        type: u4
      - id: padding2
        size: 4
      - id: error_code
        type: u4
      - id: padding3
        size: 16
  mii_data:
    seq:
      - id: mii
        type: mii
        doc: Mii data.
      - id: mii_artisan
        type: mii_artisan
        doc: Mii Artisan data.
  number:
    seq:
      - id: tag
        type: str
        size: 2
        doc: If it starts with a P, it's for posting plaza - if it starts with a C, it's for contests.
        encoding: ascii
      - id: pn_size
        type: u2
      - id: unk1
        type: u4
      - id: mii_count
        type: u4
        doc: How many miis are being displayed in total. Maximum 500.
  mii:
    seq:
      - id: tag
        type: str
        size: 2
        doc: If it starts with a P, it's for posting plaza - if it starts with a C, it's for contests.
        encoding: ascii
      - id: pm_size
        type: u2
      - id: mii_index
        type: u4
        doc: The mii and its corresponding artisan must have this same number.
      - id: entry_number
        type: u4
      - id: mii
        size: 74
      - id: crc16
        type: u2
        doc: CRC CCITT (XModem)
      - id: unknown_1
        type: u2
      - id: popularity
        type: u1
        enum: popularity
      - id: unknown_2
        type: u1
      - id: skill
        type: u2
      - id: initials
        type: str
        encoding: utf-8
        size: 2
        doc: The 2nd byte can be 0x00 to just have 1 initial.
  mii_artisan:
    seq:
      - id: tag
        type: str
        size: 2
        doc: If it starts with a P, it's for posting plaza - if it starts with a C, it's for contests.
        encoding: ascii
      - id: pc_size
        type: u2
      - id: creator_index
        type: u4
        doc: The mii and its corresponding artisan must have this same number.
      - id: creator_number
        type: u4
        doc: Somehow converts to a 12-digit number. Does it work like Nintendo Wi-Fi pids?
      - id: mii_artisan
        size: 74
      - id: crc16
        type: u2
        doc: CRC-CCITT (XModem)
      - id: unknown_1
        type: u1
      - id: master_mii_artisan_flag
        type: u1
        doc: If not zero, Master Mii Artisan displays.
      - id: unknown_2
        type: u2
      - id: unknown_3
        type: u1
      - id: country_code
        type: u1
        doc: Maps to a country flag. Uses the internal country codes that the Wii usually uses.
      - id: unknown_4
        type: u2
enums:
  popularity:
    19: has_1_star
    20: has_2_5_stars
    21: has_2_5_stars
    22: has_3_stars
    23: has_3_5_stars
    24: has_3_5_stars
    25: has_4_stars
    26: has_4_5_stars
    27: has_4_5_stars
    28: has_5_stars