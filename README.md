# txs-elevator

# Example of adding a new elevator using export // مثال على إضافة مصعد جديد باستخدام الاكسبورت
exports['txs-elevator']:AddElevator('police_station_elevator', {
    label = "Police Station Elevator",
    floors = {
        [1] = {label = "Lobby", coords = {x = 441.20, y = -982.50, z = 30.69}},
        [2] = {label = "Basement", coords = {x = 441.20, y = -982.50, z = 26.67}},
        [3] = {label = "Roof", coords = {x = 441.20, y = -982.50, z = 43.43}}
    }
})
