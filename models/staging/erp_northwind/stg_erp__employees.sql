with 

source as (

    select * from {{ source('erp', 'employees') }}

),

source_employees as (

    select
        cast(employee_id as int),
        cast(last_name as string),
        cast(first_name as string),
        cast(first_name | as | " " || last_name as string) as full_name,
        -- title,
        -- title_of_courtesy,
        cast(birth_date as date),
        cast(hire_date as date),
        cast(address as string),
        cast(city as string),
        cast(region as string),
        cast(postal_code as int),
        cast(country as string),
        -- home_phone,
        -- extension,
        -- photo,
        cast(notes as string),
        cast(reports_to as int),
        -- photo_path

    from source

)

select * from source_employees
