with

    erp_employees as (select * from {{ ref("stg_erp__employees") }}),

    erp_managers as (select * from {{ ref("stg_erp__employees") }}),

    joined as (
        select

            erp_employees.employee_id,
            erp_employees.reports_to,
            erp_employees.last_name,
            erp_employees.first_name,
            erp_employees.full_name,
            erp_managers.full_name as manager_full_name,
            erp_employees.birth_date,
            erp_employees.hire_date,
            erp_employees.address,
            erp_employees.city,
            erp_employees.region,
            erp_employees.postal_code,
            erp_employees.country,
            erp_employees.notes

        from erp_employees
        left join erp_managers on erp_employees.reports_to = erp_managers.employee_id
    )

select *
from joined
