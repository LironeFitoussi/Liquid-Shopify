# **Understanding Liquid Tags in Shopify**

In this chapter, we take a closer look at **Liquid tags**, which are a fundamental part of developing with Shopify themes. While this lesson is a review, it's essential to reinforce your understanding of how tags function in the **Liquid template language**.

---

## **What Are Liquid Tags?**

**Liquid tags** represent the **programming logic** within your Shopify theme. They instruct the template on **what actions to take**, similar to how logic works in any traditional programming language.

With Liquid tags, you can:

* **Make decisions** using conditional statements
* **Repeat blocks of code** through loops
* **Control when and how content is rendered**
* **Include reusable components** like snippets and section files

For example:

```liquid
{% if product.available %}
  <p>This product is in stock!</p>
{% endif %}
```

This conditional tag renders content **only when a specific condition is met**, showcasing the **logical capabilities** of Liquid.

---

## **Types of Liquid Tags**

There are **four main types** of tags in Liquid, each serving a different purpose:

1. **Control Flow Tags**

   * Used for conditional logic (`if`, `unless`, `case`, etc.)

2. **Iteration Tags**

   * Handle looping constructs (`for`, `cycle`, etc.)

3. **Theme Tags**

   * Manage rendering elements like snippets, sections, and templates (`render`, `include`, `section`, etc.)

4. **Variable Tags**

   * Assign and manipulate variables (`assign`, `capture`, `increment`, `decrement`, etc.)

---

In the next lesson, we’ll dive into **Control Flow Tags** and explore how they allow you to build dynamic, logic-driven templates.