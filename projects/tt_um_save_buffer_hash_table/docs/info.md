<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This is a hash table with 8 slots, 4-bit keys, and 4-bit values. Keys are entered on pins `KEY3-KEY0`, values are entered on pins `VAL3-VAL0`. When given a command, and told to execute via the `GO` line, the hash table hashes the key, and begins linearly probing into the hash table. Once a suitable slot is found, the given command is executed on that slot, or `STATUS1-STATUS0` returns a suitable error message. The table takes care to buffer the inputs so that they're not changed during probing. 

The commands are:
| Command    | CMD1 | CMD0 |   |   |
|------------|------|------|---|---|
| CMD_LOOKUP | 0    | 0    |   |   |
| CMD_INSERT | 0    | 1    |   |   |
| CMD_DELETE | 1    | 0    |   |   |

The status codes are:
| Status          | STATUS1 | STATUS0 | Description                        |
|-----------------|---------|---------|------------------------------------|
| STATUS_OK       | 0       | 0       | Operation Succeeded                |
| STATUS_FULL     | 0       | 1       | Insertion failed - hash table full |
| STATUS_NOTFOUND | 1       | 0       | Lookup failed - key not found      |
| STATUS_BUSY     | 1       | 1       | Hash table is still probing        |


## How to test

Choose a key and value to insert, such as `0x4` and `0x2`, and set the KEY and VAL lines accordingly (so in this case, `0100` and `0010`). Next, set the `CMD` lines to `CMD_INSERT`, or `01`. Lastly, set the `GO` line to `1`. The `STATUS` lines should then turn to `STATUS_BUSY` for a few cycles, empirically 15 cycles is enough for all commands, though the timing varies on the load factor. After it finishes, the `STATUS` line should return to `STATUS_OK`, and the `OVAL` lines should contain the key you inserted (`0010`)! To run another command on the table, you must set `GO` to `0` for at least one cycle before triggering another command. 

