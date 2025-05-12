# 🧱 Shopify Liquid Objects: Introduction to Dynamic and Static Data

Welcome to the **Objects chapter** of your Shopify development journey! In this lesson, you'll learn what **Liquid objects** are, how they work, and how to render both **static** and **dynamic content** in your Shopify theme.

---

## 🧠 What Are Objects in Liquid?

In **Liquid**, an **object** is similar to a **variable** in programming—think of it as a **container** for data.

> 🔁 **Analogy**: An object is like a glass—you can fill it with different kinds of information (water, ice, etc.) as long as it fits.

Objects in Liquid contain **attributes**—read-only properties that hold specific values. These values come directly from **Shopify’s servers** or your **store's backend**.

---

## 🔍 Example: The `product` Object

A **`product` object** in Liquid might contain:

* `id`
* `title`
* `description`
* `tags`
* `price`

These attributes are used to **dynamically render content** on your storefront.

---

## ⚙️ Creating Sample Products in Your Dev Store

To follow along:

1. Go to your **development store**.
2. Open the **Products** section.
3. Click **Add Product** and name it `Product Number One`.

   * Set status: **Active**
   * Add description and set pricing.
4. Save the product, then **duplicate** it.
5. Rename the duplicate to `Product Number Two`.

These two products will help demonstrate how Liquid renders different data dynamically.

---

## 🌐 Understanding Handles & Dynamic URLs

* Each product in Shopify has a unique **handle**, visible in its URL.
* This handle determines which product is shown on a **product page**.
* When previewing products, Shopify appends a special query parameter to the URL.
* You can view the clean, real URL by checking the product page in the admin.

---

## ⚡ Dynamic vs. Static Values

### 🔄 **Dynamic Values**:

* Change depending on context or parameters (like product handles).
* Example: `{{ product.title }}` renders different values on different product pages.

### 🧱 **Static Values**:

* Do **not** change across pages.
* Example: A hardcoded string or HTML like `<h1>Hello World</h1>`.

---

## 🛠️ Editing the `product.liquid` Template

1. Go to **Online Store > Actions > Edit Code**.
2. Navigate to:
   `templates/product.liquid`

You’ll see the Liquid template that controls how product pages are rendered.

---

### ✅ Example: Rendering Static Content

```liquid
<h1>Hello World</h1>
```

* Replaces the entire template output with the same message—regardless of the product.

### ✅ Example: Using JavaScript with Static Values

```html
<script>
  const staticValue = "Hello, I am a static value and I do not change.";
  document.write(staticValue);
</script>
```

* Appears on **every** product page the same way.

---

### ✅ Example: Rendering a Dynamic Object

```liquid
{{ product.title }}
```

* Displays the product title.
* On `Product One`'s page, it shows: **Product Number One**.
* On `Product Two`'s page, it shows: **Product Number Two**.

---

## 🧪 How to Render an Object Attribute

Liquid uses **dot notation** to access an attribute:

```liquid
{{ object.attribute }}
```

For example:

```liquid
{{ product.title }}
```

* `product` is the object.
* `title` is the attribute.

---

## ⚠️ Object Scope and Template Context

Not all objects are available everywhere:

| Object       | Where It’s Available   |
| ------------ | ---------------------- |
| `product`    | Product templates only |
| `cart`       | Cart templates         |
| `article`    | Blog/article templates |
| `collection` | Collection templates   |

If you try to use `product.title` on a blog page, it won’t work. For those situations, you’ll use **global objects**—which we’ll explore in the next lesson.

---

## 📌 Summary

* **Objects** store data in Liquid and behave like **variables**.
* **Attributes** are the read-only properties of objects.
* Use `{{ object.attribute }}` to display dynamic data.
* Use **static values** for unchanging text or scripts.
* Always consider the **context** (template type) when accessing objects.