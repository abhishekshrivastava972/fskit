Default (summary) view:
```
names=summary
genders=summary
events=summary
characteristics=none
exists=none
values=summary
ordinances=none
assertions=all
families=none
children=none
parents=none
personas=none
properties=none
identifiers=none
dispositions=affirming
contributors=none
locale=?
```

Versions View (_I believe in .990 the equivalent to this will be assertions=none_):
```
names=none
genders=none
events=none
```

Top-Level options:
```
families
parents
personas (modifies assertions as well)
properties
identifiers
```

Assertion options:
```
names
genders
events
characteristics
exists
ordinances
```

Modifying options:
|values=all|adds value ids to all values|
|:---------|:---------------------------|
|children=all|modifies families=all to also include children, not just the couple|
|personas=all | mine|shows which values apply to which persona|
|contributors=all|shows the contributors for each value|
|locale    |shows localized dates and places|
