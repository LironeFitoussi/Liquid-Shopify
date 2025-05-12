# 🐞 Fixing the `content_for_index` Bug in Shopify Themes

In this lesson, we’ll explore a known issue some developers have encountered when using the **`content_for_index`** object in a **Shopify Online Store 2.0** theme. Specifically, the issue where the homepage (defined in `index.liquid`) does **not display any content** in the **Theme Editor**, and the **“Add Section”** button is missing.

---

## ⚠️ The Issue

When you use `{{ content_for_index }}` in your `templates/index.liquid` file:

```liquid
{{ content_for_index }}
```

You may find that:

* Nothing renders in the Theme Editor.
* The **“Add Section”** button is missing.
* Your homepage appears empty, even though the object is correctly used.

This happens because **Online Store 2.0** prefers **JSON templates** for rendering editable sections, and `content_for_index` is considered legacy.

---

## 🛠️ Temporary Workaround Using `settings_data.json`

While the recommended approach is to switch to **JSON templates** (covered in the next lesson), here’s a workaround using **Liquid files** and the `settings_data.json` file.

---

## 🧰 Step-by-Step Fix

### 🔹 Step 1: Create a Section

1. In your **Sections** folder, create a new file:

   * Name: `hero.liquid`

2. Inside `hero.liquid`, add a basic structure:

```liquid
{% schema %}
{
  "name": "Hero",
  "settings": []
}
{% endschema %}

<div>This is a hero section</div>
```

> This section will be injected into your homepage via `settings_data.json`.

---

### 🔹 Step 2: Edit `settings_data.json`

1. Go to the **Config** folder.
2. Open `settings_data.json`.

Replace the existing structure under `"current":` with the following:

```json
{
  "current": {
    "sections": {
      "hero-section": {
        "type": "hero",
        "settings": {}
      }
    },
    "content_for_index": [
      "hero-section"
    ]
  }
}
```

### Explanation:

* `"hero-section"` is a **custom ID** for the section.
* `"type": "hero"` references the file `hero.liquid`.
* `content_for_index` is an **array of section IDs** that defines what renders on the homepage.

---

### 🔹 Step 3: Save & Reload

1. Save both files.
2. Go back to the **Theme Editor**.
3. Refresh the page.

✅ You should now see:

* Your **hero section** rendered on the homepage.
* The **“Add Section”** button re-enabled.

---

## ⚠️ Important Notes

* This is a **manual workaround** and may not be future-proof.
* Shopify is moving toward **JSON templates** for modular and maintainable theme architecture.
* You should consider **migrating to JSON-based templates** for full compatibility and best practices.

---

## 📌 Summary: Fixing `content_for_index` Rendering

| Step              | Description                                         |
| ----------------- | --------------------------------------------------- |
| Create Section    | Add a `hero.liquid` in the `sections/` folder       |
| Configure JSON    | Manually edit `settings_data.json`                  |
| Reference Section | Use the section ID in the `content_for_index` array |
| Verify in Editor  | Check Theme Editor for section visibility           |

---

In the **next lesson**, you’ll learn the modern approach: **using JSON templates** to add and manage homepage sections dynamically.