---
layout: default
title: Basic Syntax
description: The Markdown elements outlined in John Gruber's design document.
last_modified_at: 2018-08-01
---

{% include syntax.html type="basic" syntax-id="overview" %}

{% include syntax.html type="basic" syntax-id="headings" %}

{% include syntax.html type="basic" syntax-id="paragraphs" %}

{% include syntax.html type="basic" syntax-id="line-breaks" %}

{% include syntax.html type="basic" syntax-id="emphasis" %}

{% include syntax.html type="basic" syntax-id="blockquotes" %}

{% include syntax.html type="basic" syntax-id="lists" %}

{% include syntax.html type="basic" syntax-id="code" %}

{% include syntax.html type="basic" syntax-id="horizontal-rules" %}

{% include syntax.html type="basic" syntax-id="links" %}

{% include syntax.html type="basic" syntax-id="images" %}

{% include syntax.html type="basic" syntax-id="escaping-characters" %}

---
title: Overview
syntax-id: overview
api: "no"
---

Nearly all Markdown applications support the basic syntax outlined in John Gruber's original design document. There are minor variations and discrepancies between Markdown processors — those are noted inline wherever possible.

<div class="alert alert-info">
  <i class="fas fa-info-circle"></i> <strong>Note:</strong> Using Markdown doesn't mean that you can't also use HTML. You can add HTML tags to any Markdown file. This is helpful if you prefer certain HTML tags to Markdown syntax. For example, some people find that it's easier to use HTML tags for images.
</div>

---
title: Headings
syntax-id: headings
syntax-summary: |
  # H1
  ## H2
  ### H3
description: "To create a heading, add number signs (`#`) in front of a word or phrase. The number of number signs you use should correspond to the heading level. For example, to create a heading level three (`<h3>`), use three number signs (e.g., `### My Header`)."
examples:
  - markdown: "# Heading level 1"
    html: "<h1>Heading level 1</h1>"
  - markdown: "## Heading level 2"
    html: "<h2>Heading level 2</h2>"
  - markdown: "### Heading level 3"
    html: "<h3>Heading level 3</h3>"
  - markdown: "#### Heading level 4"
    html: "<h4>Heading level 4</h4>"
  - markdown: "##### Heading level 5"
    html: "<h5>Heading level 5</h5>"
  - markdown: "###### Heading level 6"
    html: "<h6>Heading level 6</h6>"
additional-examples:
  - name: "Alternative H1 Syntax"
    description: "Alternatively, on the line below the text, add any number of == characters for heading level 1."
    markdown: |
      Heading level 1
      ===============
    html: "<h1>Heading level 1</h1>"
  - name: "Alternative H2 Syntax"
    description: "Alternatively, on the line below the text, add any number of -- characters for heading level 2."
    markdown: |
      Heading level 2
      ---------------
    html: "<h2>Heading level 2</h2>"
---

To create a heading, add number signs (`#`) in front of a word or phrase. The number of number signs you use should correspond to the heading level. For example, to create a heading level three (`<h3>`), use three number signs (e.g., `### My Header`).

<table class="table table-bordered">
  <thead class="thead-light">
    <tr>
      <th>Markdown</th>
      <th>HTML</th>
      <th>Rendered Output</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code class="highlighter-rouge"># Heading level 1</code></td>
      <td><code class="highlighter-rouge">&lt;h1&gt;Heading level 1&lt;/h1&gt;</code></td>
      <td><h1 class="no-anchor" data-toc-skip>Heading level 1</h1></td>
    </tr>
    <tr>
      <td><code class="highlighter-rouge">## Heading level 2</code></td>
      <td><code class="highlighter-rouge">&lt;h2&gt;Heading level 2&lt;/h2&gt;</code></td>
      <td><h2 class="no-anchor" data-toc-skip>Heading level 2</h2></td>
    </tr>
    <tr>
      <td><code class="highlighter-rouge">### Heading level 3</code></td>
      <td><code class="highlighter-rouge">&lt;h3&gt;Heading level 3&lt;/h3&gt;</code></td>
      <td><h3 class="no-anchor" data-toc-skip>Heading level 3</h3></td>
    </tr>
    <tr>
      <td><code class="highlighter-rouge">#### Heading level 4</code></td>
      <td><code class="highlighter-rouge">&lt;h4&gt;Heading level  4&lt;/h4&gt;</code></td>
      <td><h4 class="no-anchor">Heading level 4</h4></td>
    </tr>
    <tr>
      <td><code class="highlighter-rouge">##### Heading level 5</code></td>
      <td><code class="highlighter-rouge">&lt;h5&gt;Heading level 5&lt;/h5&gt;</code></td>
      <td><h5 class="no-anchor">Heading level 5</h5></td>
    </tr>
    <tr>
      <td><code class="highlighter-rouge">###### Heading level 6</code></td>
      <td><code class="highlighter-rouge">&lt;h6&gt;Heading level 6&lt;/h6&gt;</code></td>
      <td><h6 class="no-anchor">Heading level 6</h6></td>
    </tr>
  </tbody>
</table>

### Alternate Syntax

Alternatively, on the line below the text, add any number of `==` characters for heading level 1 or `--` characters for heading level 2.

<table class="table table-bordered">
  <thead class="thead-light">
    <tr>
      <th>Markdown</th>
      <th>HTML</th>
      <th>Rendered Output</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code class="highlighter-rouge">Heading level 1<br/>===============</code></td>
      <td><code class="highlighter-rouge">&lt;h1&gt;Heading level 1&lt;/h1&gt;</code></td>
      <td><h1 class="no-anchor" data-toc-skip>Heading level 1</h1></td>
    </tr>
    <tr>
      <td><code class="highlighter-rouge">Heading level 2<br/>---------------</code></td>
      <td><code class="highlighter-rouge">&lt;h2&gt;Heading level 2&lt;/h2&gt;</code></td>
      <td><h2 class="no-anchor" data-toc-skip>Heading level 2</h2></td>
    </tr>
  </tbody>
</table>
