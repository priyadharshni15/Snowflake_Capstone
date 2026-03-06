select
    a.accountid,
    a.address,
    a.modelid,
    a.advisorid,
    a.bdid,
    a.custodian,
    m.modelname,
    m.strategistid,
    m.strategistcode,
    m.strategistname,
    h.ticker,
    h.cusip,
    h.shares,
    h.marketvalue,
    h.date,
    h.description

from {{ ref('stg_account') }} a
inner join {{ ref('stg_model') }} m 
    on a.modelid = m.modelid
inner join {{ ref('stg_holdings') }} h 
    on m.strategistid = h.strategistid