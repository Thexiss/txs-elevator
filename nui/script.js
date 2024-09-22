// -- Discord.gg/txs -- //

window.addEventListener('message', function(event) {
    const data = event.data;
    
    if (data.action === 'open') {
        document.getElementById('elevatorTitle').innerText = data.elevator.label;

        const floorList = document.getElementById('floorList');
        floorList.innerHTML = '';

        const sortedFloors = Object.keys(data.elevator.floors).sort((a, b) => b - a);

        sortedFloors.forEach((index) => {
            const floorLabel = (index == 0) ? 'G' : index;  // Convert 0 to 'G'

            const button = document.createElement('button');
            button.innerText = floorLabel; 

            setTimeout(() => {
                document.querySelector('#elevatorMenu').classList.add('active');
            }, 10);

            button.addEventListener('click', () => {
                if (index != data.currentFloor-1) {
                    document.querySelector('#elevatorMenu').classList.remove('active');
                    fetch(`https://${GetParentResourceName()}/selectFloor`, {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify({ floor: index })
                    });
                }
            });

            if (index == data.currentFloor-1) {
                button.classList.add('active-floor');
            }

            floorList.appendChild(button);
        });
    }
});

window.addEventListener('keydown', function(event) {
    if (event.key === "Escape") {
        document.querySelector('#elevatorMenu').classList.remove('active');
        fetch(`https://${GetParentResourceName()}/closeMenu`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            }
        });
    }
});
