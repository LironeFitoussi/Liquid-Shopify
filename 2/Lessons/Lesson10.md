# 🛠️ Fixing the Missing “Add Section” Button Using JSON Templates in Shopify

In the previous lesson, you learned how to fix the missing **“Add Section”** button using `settings_data.json`. Today, we’ll solve the same issue the **correct and modern way**: by using **JSON templates**, introduced with **Shopify Online Store 2.0**.

---

## 📄 What Are JSON Templates?

A **JSON template** is a new type of template file (`.json`) used in Shopify to define **which sections appear** on a page, and **in what order**.

### Benefits:

* Allows drag-and-drop **customization** of homepage sections.
* Powers the “Add Section” functionality in the Shopify **Theme Editor**.
* Replaces older Liquid templates like `index.liquid` with a more modular structure.

---

## ❌ The Problem with `index.liquid`

If your theme uses a **Liquid-based homepage template** (`templates/index.liquid`), you might experience:

* No visible sections in the Theme Editor.
* The **“Add Section”** button is **missing**.
* Incompatibility with Shopify's customization tools.

---

## ✅ The JSON Template Fix

Follow these steps to fix the issue by creating a proper `index.json` template:

---

### 🔹 Step 1: Rename the Existing `index.liquid`

You cannot create a new `index.json` if `index.liquid` already exists.

1. In the **Templates** folder:

   * Rename `index.liquid` to `index_old.liquid`.

---

### 🔹 Step 2: Create `index.json`

1. In the **Templates** folder:

   * Click **“Add a new template”** ➜ Choose `JSON` ➜ Template type: `index`.

2. A new file named `index.json` will be created.

---

### 🔹 Step 3: Define Sections and Order

Edit `index.json` to include the following structure:

```json
{
  "sections": {
    "main-index-section": {
      "type": "main-index"
    },
    "example-section": {
      "type": "example-section"
    }
  },
  "order": [
    "main-index-section",
    "example-section"
  ]
}
```

* **`sections`**: Defines section IDs and the file (`type`) they reference in the `sections/` folder.
* **`order`**: Controls the **display sequence** of the sections.

---

### 🔹 Step 4: Create Referenced Sections

In the **Sections** folder:

1. Create a new file: `main-index.liquid`

   ```liquid
   <div>Hello Celeste!</div>
   ```

2. Create another file: `example-section.liquid`

   ```liquid
   <div>This is the example section.</div>
   ```

Each section should also include a basic `{% schema %}` block to define its name and settings in the Theme Editor:

```liquid
{% schema %}
{
  "name": "Example Section",
  "settings": []
}
{% endschema %}
```

> ⚠️ **Important:** The `type` used in the JSON file must match the **file name** (without `.liquid`).

---

### 🔹 Step 5: Test the Theme Editor

1. Open the **Theme Editor** (click **“Customize”** on your theme).
2. You should now see:

   * Your custom **sections** rendered.
   * The **“Add Section”** button re-enabled.
   * Ability to rearrange and add more sections dynamically.

---

## 🔁 Changing Section Order

Modify the `order` array in `index.json`:

```json
"order": [
  "example-section",
  "main-index-section"
]
```

This will swap the display order of the sections in the storefront and the editor.

---

## 📌 Summary

| Task                 | Action                                                             |
| -------------------- | ------------------------------------------------------------------ |
| Legacy Issue         | `content_for_index` does not load sections or “Add Section” button |
| Modern Fix           | Use `index.json` to structure homepage sections                    |
| Key JSON Fields      | `sections` and `order`                                             |
| Section Requirements | Create `.liquid` files with matching names                         |
| Result               | Dynamic homepage editing enabled via the Theme Editor              |

---

By using **JSON templates**, you align your Shopify theme with modern best practices and ensure full compatibility with **Online Store 2.0** features.