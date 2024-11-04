WITH drugpurchaseprice AS (
    SELECT d.name AS drug_name, p.name AS pharmacy, c.price AS drug_price, c.quantity AS contract_quantity
    FROM drugs d
    INNER JOIN contracts c ON c.drug_name = d.name
    INNER JOIN pharmacies p ON c.pharmacy_id = p.id
),
pharmacyfillcost AS (
	SELECT d.name AS drug_name, p.name AS pharmacy, pf.cost AS drug_cost,pr.quantity AS fill_quantity
    FROM drugs d
	INNER JOIN contracts c
	ON c.drug_name = d.name
    INNER JOIN pharmacies p 
	ON c.pharmacy_id = p.id
	INNER JOIN pharmacy_fills pf
	ON pf.pharmacy_id = p.id
    INNER JOIN prescriptions pr
    ON pr.id = pf.prescription_id
)
SELECT 
    dpp.drug_name,
    dpp.pharmacy,
    ((pfc.drug_cost / pfc.fill_quantity) - (dpp.drug_price / dpp.contract_quantity)) / (dpp.drug_price / dpp.contract_quantity) * 100 AS percentage_markup
FROM drugpurchaseprice dpp
INNER JOIN pharmacyfillcost pfc
    ON dpp.drug_name = pfc.drug_name AND dpp.pharmacy = pfc.pharmacy;
