# Sequence to table operator

##### Description

`seq2table` Converts a biological sequence to a tabular format.

##### Usage

Input projection|.
---|---
`row`        | character, sequences to convert

Output relations|.
---|---
`letter`        | character, letter (amino or nucleic acid)
`position`        | numeric, position in the sequence
`presence`        | boolean, presence of a letter (if 0, gap in the alignment corresponding to a "-" character in the sequence)

##### Details

#### References

##### See Also

#### Examples
