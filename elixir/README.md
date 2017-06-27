## Using TextTest

Added a mix task that generates the same output format as the TextTest utility expects, and a shell script wrapper to call this from the TextTest config file.

From within this elixir directory run: 

```mix texttest.fixture [<days>]```

or

```./texttest_fixture.sh [<days>]```


Once texttest is installed, from within the texttest directory:

 - In `config.gr` 
   - Set the `default_checkout:` parameter to the root of the checked out git repository
   - Comment out the section for Java
   - Uncomment the section for Elixir
 - Run `texttest -con -l` to

