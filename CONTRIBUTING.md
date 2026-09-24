# Contributing to al-folio

Thank you for considering contributing to al-folio!

## Pull Requests

We welcome your pull requests (PRs).
For minor fixes (e.g., documentation improvements), feel free to submit a PR directly.
If you would like to implement a new feature or a bug, please make sure you (or someone else) has opened an appropriate issue first; in your PR, please mention the issue it addresses.

Note that since [#2048](https://github.com/alshedivat/al-folio/pull/2048) al-folio uses the [prettier formatter](https://prettier.io/) for its code, meaning all new submitted code must conform to its standard. If you don't have `prettier` installed for your setup and the `prettier` code check fails when submitting a PR, you can check the referred failed action in our repo. In that action there will be an artifact with an HTML diff showing the needed changes.

### Formatting

Use Node.js 24 and the locked dependencies to match the formatter workflow:

```sh
npm ci
npx --no-install prettier . --check
```

To apply the required formatting, run `npx --no-install prettier . --write` and review the diff before committing. The check covers the whole repository,
not only the files changed in a pull request, and expects LF line endings.

### Research entries

Every entry in `_bibliography/papers.bib` needs one `research_area`: `foliations`, `higher-geometry`, `noncommutative-physics`,
`language-models`, or `applied-ai`. These are the five sections in `_pages/publications.md`; entries without a matching area will not appear there.
Use the comma-separated `keywords` field for secondary topic tags rather than duplicating an entry across subjects.

Years are grouped newest first within each subject. The `number_publications` filter assigns native HTML list numbers across all subjects and years,
so do not enter paper numbers manually. Numbers remain unchanged when search hides other entries. Keep different editions of the same work in one entry
with separate links, as with the dissertation and its arXiv version. Preserve retired citation keys in the comma-separated `ids` field so existing
publication bookmarks still work.

Run the catalog and numbering regression tests with `bundle exec ruby test/number_publications_test.rb`, then build the site with `bundle exec jekyll build`.

## Issues

We use GitHub issues to track bugs and feature requests.
Before submitting an issue, please make sure:

1. You have read [the FAQ section](FAQ.md) of the README and your question is NOT addressed there.
2. You have done your best to ensure that your issue is NOT a duplicate of one of [the previous issues](https://github.com/alshedivat/al-folio/issues).
3. Your issue is either a bug (unexpected/undesirable behavior) or a feature request.
   If it is just a question, please ask it in the [Discussions](https://github.com/alshedivat/al-folio/discussions) forum.

When submitting an issue, please make sure to use the appropriate template.

## License

By contributing to al-folio, you agree that your contributions will be licensed
under the LICENSE file in the root directory of the source tree.
