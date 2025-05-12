# 🌍 Shopify Liquid Global Objects vs Regular Objects

In this lesson, we'll explore the concept of **global objects** in Shopify Liquid and how they differ from **regular (template-scoped) objects**. Understanding this distinction is essential when you start working with different types of files in a Shopify theme—**templates**, **sections**, **snippets**, and **layout files**.

---

## 🔄 What Is a Global Object?

A **global object** is a special type of Liquid object that can be accessed **from any file** in your Shopify theme:

* **Template files** (`.liquid` templates)
* **Section files**
* **Snippet files**
* **Layout files**

This makes them incredibly useful for rendering dynamic content in places where regular objects (like `product`, `collection`, etc.) aren't available.

---

## 🧱 Regular Objects: Context-Dependent

Regular objects, like `product`, only work in specific contexts:

| Object    | Available In                |
| --------- | --------------------------- |
| `product` | Product template pages only |
| `cart`    | Cart template only          |
| `article` | Blog/article templates      |

For example:

```liquid
{{ product.title }}
```

* ✅ Works inside `product.liquid`
* ❌ Fails inside `theme.liquid`, `index.liquid`, etc.

---

## 🧪 Demonstration: Regular vs Global Object

### ✅ Using the `product` Object in `product.liquid`

```liquid
{{ product.description }}
```

* Displays the product’s description correctly **only** on the product page.

### ❌ Using `product.title` in `theme.liquid`

```liquid
{{ product.title }}
```

* **Does not work** on non-product pages.
* This is because the `product` object isn't in scope outside of product-related templates.

---

## 🌐 Introducing the `all_products` Global Object

To work around the scope limitations of regular objects, use a **global object** like `all_products`.

### Syntax:

```liquid
{{ all_products["product-handle"].attribute }}
```

* `all_products` → Global object containing all products
* `"product-handle"` → The product's handle (unique identifier in the URL)
* `.attribute` → e.g., `title`, `price`, `description`, etc.

---

## 🔍 Example: Render Product Price in `theme.liquid`

1. Go to `theme.liquid` under the **Layout** folder.
2. Insert the following code:

```liquid
{{ all_products["product-1"].price }}
```

> Replace `"product-1"` with the actual **handle** of your product (e.g., `"product-one"`).

### Note:

* This renders the product price globally—even on the **homepage** or other non-product pages.
* The price will appear as a **raw number** (e.g., `12400` for \$124.00) unless formatted with filters (which will be covered in a later lesson).

---

## ✅ Output Comparison

| Page             | Output                                                |
| ---------------- | ----------------------------------------------------- |
| `product.liquid` | Product-specific info via `product` object            |
| `theme.liquid`   | Same info accessed via `all_products` object          |
| Homepage         | ✅ Can render dynamic product data using global object |
| Blog, Cart, etc. | ✅ Works with `all_products` but not with `product`    |

---

## 📌 Summary

| Feature               | Regular Object (`product`)   | Global Object (`all_products`)       |
| --------------------- | ---------------------------- | ------------------------------------ |
| Scope                 | Limited to product templates | Available in all Liquid files        |
| Example Usage         | `{{ product.title }}`        | `{{ all_products["handle"].title }}` |
| Requires Context Page | ✅ Yes                        | ❌ No                                 |
| Can Be Used Globally  | ❌ No                         | ✅ Yes                                |