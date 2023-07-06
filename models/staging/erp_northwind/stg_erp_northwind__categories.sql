with

    source as (select * from {{ source("erp_northwind", "categories") }}),

    renamed as (

        select
            cast(category_id as int) as category_id,
            cast(category_name as string) as category_name,
            cast(description as string) as description
        -- picture	
        from source

    )

select *
from renamed
