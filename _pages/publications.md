---
layout: page
permalink: /publications/
title: Research
description: Papers and works in progress, organized by subject and then by year.
nav: true
nav_order: 2
scholar:
  group_by: year
  group_order: descending
  bibliography_group_tag: h3
---

{% include bib_search.liquid %}

{% capture research_publications %}

<section class="research-subject" aria-labelledby="foliations">
  <h2 id="foliations">Foliations, Higher Holonomy &amp; Characteristic Classes</h2>
  {% bibliography --query @*[research_area=foliations] %}
</section>

<section class="research-subject" aria-labelledby="higher-geometry">
  <h2 id="higher-geometry">Higher, Derived &amp; Smooth Geometry</h2>
  {% bibliography --query @*[research_area=higher-geometry] %}
</section>

<section class="research-subject" aria-labelledby="noncommutative-physics">
  <h2 id="noncommutative-physics">Noncommutative Geometry &amp; Mathematical Physics</h2>
  {% bibliography --query @*[research_area=noncommutative-physics] %}
</section>

<section class="research-subject" aria-labelledby="language-models">
  <h2 id="language-models">Language Models &amp; Evaluation</h2>
  {% bibliography --query @*[research_area=language-models] %}
</section>

<section class="research-subject" aria-labelledby="applied-ai">
  <h2 id="applied-ai">AI for Science, Engineering &amp; Finance</h2>
  {% bibliography --query @*[research_area=applied-ai] %}
</section>
{% endcapture %}

<div class="publications research-publications">
  {{ research_publications | number_publications }}
</div>
