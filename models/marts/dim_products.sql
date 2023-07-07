with

    products as (select * from {{ ref("stg_erp_northwind__products") }}),

    categories as (select * from {{ ref("stg_erp_northwind__categories") }}),

    suppliers as (select * from {{ ref("stg_erp_northwind__suppliers") }}),

    joined as (

        select
            products.product_id,
            products.supplier_id,
            products.category_id,
            products.product_name,
            products.quantity_per_unit,
            products.unit_price,
            products.units_in_stock,
            products.units_on_order,
            products.reorder_level,
            products.is_discontinued,
            categories.category_name,
            categories.description,
            suppliers.company_name,
            suppliers.contact_name,
            suppliers.address,
            suppliers.city,
            suppliers.region,
            suppliers.postal_code,
            suppliers.country

        from products
        left join categories on products.category_id = categories.category_id
        left join suppliers on products.supplier_id = suppliers.supplier_id
    )

select *
from joined
limit 10
