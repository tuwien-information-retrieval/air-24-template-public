what is this?

-   `allennlp` is unmaintained and a pain to install because it [breaks on arm64 archs](https://github.com/allenai/allennlp/issues/5569) and has many outdated dependencies. a `Dockerfile` will save you the trouble.

-   if you compress the dataset for this exercise you'll end up with 0.5 GB that you can be easily added to the repository. some might argue that this is a bad practice, but i think it's fine for this use case and helps with reproducibility.

installation:

-   conda:

    works great. no issues.

-   docker:

    works well - unless you want to use the latest stable vscode version as of may 2024.

    see: https://github.com/microsoft/vscode/issues/174632

-   google colab:

    not an option.
    
    see: https://github.com/sebastian-hofstaetter/teaching/discussions/129 (ok these guys might have made it, but i don't know how)

    see: https://github.com/googlecolab/colabtools/issues/4212#issuecomment-1856302948

    see: https://www.reddit.com/r/GoogleColab/comments/13605i3/comment/jinqaz3/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
