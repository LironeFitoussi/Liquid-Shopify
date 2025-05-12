# **Control Flow Tags in Liquid (Shopify)**

**Control Flow tags** in Liquid enable developers to build **dynamic, logic-driven templates** by executing code based on specific conditions. These tags are foundational in **Shopify theme customization**, allowing templates to behave differently depending on data values.

---

## **Overview: What Are Control Flow Tags?**

Control flow tags in Liquid are used to:

* Make **decisions** using conditions
* Create **branches** in logic flow
* Provide **alternate outputs** based on values
* Combine multiple conditions using logical **operators**

There are **five primary control flow tags**:

1. **`if`**
2. **`unless`**
3. **`elsif` / `else if`**
4. **`case` / `when`**
5. **Logical Operators** (`and`, `or`)

---

## **1. `if` Tag**

The `if` tag executes code **only when a condition is true**.

**Syntax Example:**

```liquid
{% if all_products['product-1'].title == "Product Number One" %}
  The title of the product is Product Number One.
{% endif %}
```

* Requires a matching **`endif`** to close the block.
* Conditions can use operators like `==`, `!=`, `>`, `<`, etc.

---

## **2. `unless` Tag**

The `unless` tag is the **inverse of `if`**. It executes code **only when a condition is false**.

**Syntax Example:**

```liquid
{% unless all_products['product-1'].title == "Product Number One" %}
  The product title is NOT Product Number One.
{% endunless %}
```

---

## **3. `elsif` / `else if` and `else` Tags**

These tags allow for **additional branching** after an `if` statement:

**Syntax Example:**

```liquid
{% if all_products['product-1'].title == "Product A" %}
  This is Product A.
{% elsif all_products['product-2'].title == "Product B" %}
  This is Product B.
{% else %}
  This is neither Product A nor B.
{% endif %}
```

* Use **`elsif`** (or `else if`) for additional conditions.
* **`else`** executes when no prior conditions are met.
* You do **not** need to use a separate closing tag for `else` or `elsif`.

---

## **4. `case` / `when` Tag**

The `case` tag is similar to a **switch statement** in traditional programming.

**Syntax Example:**

```liquid
{% case all_products['product-1'].title %}
  {% when "Product Number One" %}
    This is Product Number One.
  {% when "Product Number Two" %}
    This is Product Number Two.
  {% else %}
    The title is neither Product Number One nor Product Number Two.
{% endcase %}
```

* Use **`when`** for each value to compare against.
* Use **`else`** for default behavior.

---

## **5. Logical Operators: `and` / `or`**

Use logical operators to **combine multiple conditions**.

**AND Operator:**

```liquid
{% if line_item.grams > 20000 and customer.address.city == "Ottawa" %}
  You’re buying a heavy item and live in Ottawa.
{% endif %}
```

* Both conditions must be true.

**OR Operator:**

```liquid
{% if product.available or product.price < 20 %}
  The product is either available or priced under $20.
{% endif %}
```

* Only one condition needs to be true.

---

## **Best Practices**

* **Always close tags** (`endif`, `endunless`, `endcase`).
* Use **clear and descriptive conditions** for better readability.
* Prefer `case` for multiple static value checks to keep code clean.
* Use `unless` cautiously — sometimes using `if` with `!=` is clearer.

---

In the next lesson, we’ll explore **Iteration Tags**, which allow you to loop through collections like product lists, arrays, or blog articles.