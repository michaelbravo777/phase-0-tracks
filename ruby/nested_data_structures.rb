# ====================================== 
#
# ====================================== 

job_family = {
    accounting: {
        staff_accountants: [
            "Solvor Sulon", 
            "Lorij Awrak", 
            "Kolyda Ghatherorm"
        ],
        seniour_accounting_officers: [
            "Nejuco Woriban"
        ],
        accounting_managers: [
            "Draorm Lipyca", 
            "Hatl Didelkim"
        ]
    },
    budget: {
        seniour_budget_officers: [
            "Dir Taiage", 
            "Lorang Serest"
        ],
        assistant_budget_directors: [
            "Adang  Canpol", 
            "Atom Ton'orm", 
            "Itnem  Ackhkin"
        ]
    },
    investment: {
        investment_account_managers: [
            "Icere  Worot", 
            "Elmyet Issat"
        ],
        investment_analysts: [
            "Yoiss Delmos"
        ]
    },
}

p job_family[:accounting][:staff_accountants][2]

p job_family[:budget][:seniour_budget_officers]

p job_family[:investment][:investment_analysts].push("Imxban Dynton")
