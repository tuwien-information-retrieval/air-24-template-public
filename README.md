what is this?

-   `allennlp` is unmaintained and a pain to install because it [breaks on arm64 archs](https://github.com/allenai/allennlp/issues/5569) and has many outdated dependencies. a `Dockerfile` will save you the trouble.

-   if you compress the dataset for this exercise you'll end up with 0.5 GB that you can be easily added to the repository. some might argue that this is a bad practice, but i think it's fine for this use case and helps with reproducibility.
