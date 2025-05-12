# **Introduction to Shopify Liquid**

**Shopify Liquid** is the templating language used to create and customize Shopify themes. It's an essential tool for developers working with Shopify stores, allowing dynamic content rendering and layout control.

---

## **What is Shopify Liquid?**

Shopify Liquid is a **template language** written in **Ruby**, though its syntax is distinct from Ruby or most common programming languages. It acts as a **middle layer** between Shopify’s servers and the store's front end. When a Shopify store requests data, Liquid fetches this data from the Shopify server and renders it into the theme. If the data isn't available, Shopify returns a `404` response.

### Key Characteristics:

* **Written in Ruby** but with its own syntax.
* **Limited in scope** – can't fetch third-party data directly.
* Used for **rendering static and dynamic content**.

---

## **Static vs Dynamic Content**

* **Static content**: Hardcoded in HTML, does not change (e.g., homepage headers).
* **Dynamic content**: Changes based on parameters (e.g., product pages using URL handles).

### Example:

A product page rendering a specific cat product uses the **URL handle** to determine which product to show. Changing the handle dynamically changes the product being displayed.

---

## **Shopify Theme Architecture**

Shopify uses **JSON templates and section files** to build pages. These section files often contain a mix of:

* **HTML**
* **CSS**
* **JavaScript**
* **Liquid code**

---

## **Core Features of Shopify Liquid**

Shopify Liquid is built on **three core features**:

### 1. **Objects**

* Represent **store data**.
* Wrapped in double curly braces: `{{ ... }}`
* Accessed via **dot notation**.

**Example**:

```liquid
{{ shop.name }}
```

This outputs the store's name.

For a full list of objects and their attributes, refer to the [Shopify Liquid Reference](https://shopify.dev/docs/api/liquid).

---

### 2. **Tags**

Tags provide **logic and control flow** within templates. They are enclosed in:

```liquid
{% ... %}
```

#### Categories of Tags:

* **Control Flow Tags**: Conditional logic (e.g., `if`, `unless`, `elsif`, `case`, `when`, `endif`)
* **Iteration Tags**: Loops (e.g., `for`)

  * Example:

    ```liquid
    {% for product in collection.products %}
      <h1>{{ product.title }}</h1>
    {% endfor %}
    ```
* **Theme Tags**: Theme-specific rendering (e.g., `form`, `section`, `layout`, `paginate`)
* **Variable Tags**: Declare and assign variables using:

  * `assign` (simple assignment)
  * `capture` (stores content in a block)

**Variable Example**:

```liquid
{% assign store_name = shop.name %}
{{ store_name }}
```

---

### 3. **Filters**

Filters **modify the output** of objects. They are applied using the **pipe symbol (`|`)**.

**Example**:

```liquid
{{ product.title | upcase }}
```

This transforms the product title to uppercase.

#### Common Filter Categories:

* **String filters** (`upcase`, `downcase`, `truncate`)
* **Number filters** (`plus`, `minus`, `times`)
* **Array filters** (`join`, `first`, `last`)
* **URL filters**, **color filters**, etc.

---

## **Conclusion**

Shopify Liquid is a powerful but streamlined templating language tailored for building and customizing Shopify themes. While it has limitations—like the inability to fetch third-party data—it excels in rendering structured store content and managing layout logic.

If you want to explore more, Shopify's official documentation provides in-depth resources on **objects**, **tags**, and **filters**.
