<#
    Function searches for the food you've entered and lists some options, Depending upon your choice it then lists it's Nutritional value
    
    From : Prateek Singh - @singhPrateik
#>

Function Get-Nutrient
{
    Param
    (
        [Parameter(Mandatory=$True)] [String] $Query
    )
    
    $GLobal:i=0
    $result = ((iwr -Uri "http://api.nal.usda.gov/ndb/search/?format=json&q=$Query&sort=n&max=25&offset=0&api_key=nPEalh5PismxDHfVfSJ0VhSAG3uma32bgqO2RtEs").content | ConvertFrom-Json).list.item`
    | ?{$_.name -like "*$Query*"} | Get-Random -Count 10 |select @{n='Choice';e={$GLobal:i=$GLobal:i+1;$GLobal:i}},Name, Ndbno

    Write-Output $result |select Choice, Name |Out-String
    $Choice = Read-Host "Enter You choice"

    $ndbno = ($result | ?{$_.choice -eq $Choice}).ndbno

    $food = ((iwr -Uri "http://api.nal.usda.gov/ndb/reports/?ndbno=$ndbno&type=b&format=json&api_key=nPEalh5PismxDHfVfSJ0VhSAG3uma32bgqO2RtEs").content |ConvertFrom-Json).report.food
    
    "`n--------------------------------"
    "FOOD NAME : "+$food.name
    "--------------------------------"
    
    $food.nutrients | ?{$_.value -ne 0} | select Name, Group, Value, unit, @{n='Measures';e={$PV = $_;Foreach($Item in $pv.measures){"$([int]$Item.qty) "+$Item.Label+" = $($Item.value) "+$PV.unit}}} |ft -AutoSize

}


<#
    PS C:\> Get-Nutrient mango
    
    Choice name
    ------ ----
         1 Beverages, FUZE, orange mango, fortified with vitamins A, C, E, B6
         2 Mango nectar, canned
         3 Beverages, V8 SPLASH Smoothies, Peach Mango
         4 V8, V8 V-FUSION BEVERAGE PEACH MANGO, UNPREPARED, GTIN: 10051000202526
         5 Mangos, raw
         6 Babyfood, GERBER, 3rd Foods, apple, mango and kiwi
         7 V8, V8 V-FUSION BEVERAGE PEACH MANGO, UNPREPARED, GTIN: 10051000202441
         8 Babyfood, fruit dessert, mango with tapioca
         9 Fruit juice smoothie, NAKED JUICE, MIGHTY MANGO
        10 Beverages, V8 V-FUSION Juices, Peach Mango
    
    
    Enter You choice: 2
    
    --------------------------------
    FOOD NAME : Mango nectar, canned
    --------------------------------
    
    name                               group      value unit Measures
    ----                               -----      ----- ---- --------
    Water                              Proximates 86.63 g    1 cup = 217.44 g
    Energy                             Proximates 51    kcal 1 cup = 128 kcal
    Protein                            Proximates 0.11  g    1 cup = 0.28 g
    Total lipid (fat)                  Proximates 0.06  g    1 cup = 0.15 g
    Carbohydrate, by difference        Proximates 13.12 g    1 cup = 32.93 g
    Fiber, total dietary               Proximates 0.3   g    1 cup = 0.8 g
    Sugars, total                      Proximates 12.45 g    1 cup = 31.25 g
    Calcium, Ca                        Minerals   17    mg   1 cup = 43 mg
    Iron, Fe                           Minerals   0.36  mg   1 cup = 0.90 mg
    Magnesium, Mg                      Minerals   3     mg   1 cup = 8 mg
    Phosphorus, P                      Minerals   2     mg   1 cup = 5 mg
    Potassium, K                       Minerals   24    mg   1 cup = 60 mg
    Sodium, Na                         Minerals   5     mg   1 cup = 13 mg
    Zinc, Zn                           Minerals   0.02  mg   1 cup = 0.05 mg
    Vitamin C, total ascorbic acid     Vitamins   15.2  mg   1 cup = 38.2 mg
    Thiamin                            Vitamins   0.003 mg   1 cup = 0.008 mg
    Riboflavin                         Vitamins   0.003 mg   1 cup = 0.008 mg
    Niacin                             Vitamins   0.080 mg   1 cup = 0.201 mg
    Vitamin B-6                        Vitamins   0.015 mg   1 cup = 0.038 mg
    Folate, DFE                        Vitamins   7     µg   1 cup = 18 µg
    Vitamin B-12                       Vitamins   0.00  µg   1 cup = 0.00 µg
    Vitamin A, RAE                     Vitamins   35    µg   1 cup = 88 µg
    Vitamin A, IU                      Vitamins   692   IU   1 cup = 1737 IU
    Vitamin E (alpha-tocopherol)       Vitamins   0.21  mg   1 cup = 0.53 mg
    Vitamin D (D2 + D3)                Vitamins   0.0   µg   1 cup = 0.0 µg
    Vitamin K (phylloquinone)          Vitamins   0.8   µg   1 cup = 2.0 µg
    Fatty acids, total saturated       Lipids     0.014 g    1 cup = 0.035 g
    Fatty acids, total monounsaturated Lipids     0.022 g    1 cup = 0.055 g
    Fatty acids, total polyunsaturated Lipids     0.011 g    1 cup = 0.028 g
    Fatty acids, total trans           Lipids     0.000 g    1 cup = 0.000 g

#>
