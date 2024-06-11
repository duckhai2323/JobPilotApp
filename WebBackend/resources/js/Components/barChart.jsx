import { Bar } from "react-chartjs-2"
import { 
    Chart as ChartJS,  
    CategoryScale,
    LinearScale,
    BarElement,
    Title,
    Tooltip,
    Legend
} from "chart.js"

ChartJS.register(
    CategoryScale,
    LinearScale,
    BarElement,
    Title,
    Tooltip,
    Legend 
)

function getGradient1(ctx, chartArea) {
    const { top, bottom, left, right, width, height } = chartArea
    const gradientBg = ctx.createLinearGradient(0, top, 0, bottom)
    const color1 = "#4df98f"
    const color2 = "transparent"

    gradientBg.addColorStop(0, color1)
    gradientBg.addColorStop(1, color2)

    return gradientBg
}

function getGradient2(ctx, chartArea) {
    const { top, bottom, left, right, width, height } = chartArea
    const gradientBg = ctx.createLinearGradient(0, top, 0, bottom)
    const color1 = "#777dd1"
    const color2 = "transparent"

    gradientBg.addColorStop(0.5, color1)
    gradientBg.addColorStop(1, color2)

    return gradientBg
}

function getGradient3(ctx, chartArea) {
    const { top, bottom, left, right, width, height } = chartArea
    const gradientBg = ctx.createLinearGradient(0, top, 0, bottom)
    const color1 = "#f99a4d"
    const color2 = "transparent"

    gradientBg.addColorStop(0.5, color1)
    gradientBg.addColorStop(1, color2)

    return gradientBg
}

function getGradient4(ctx, chartArea) {
    const { top, bottom, left, right, width, height } = chartArea
    const gradientBg = ctx.createLinearGradient(0, top, 0, bottom)
    const color1 = "#4df9f0"
    const color2 = "transparent"

    gradientBg.addColorStop(0.5, color1)
    gradientBg.addColorStop(1, color2)

    return gradientBg
}

function getGradient5(ctx, chartArea) {
    const { top, bottom, left, right, width, height } = chartArea
    const gradientBg = ctx.createLinearGradient(0, top, 0, bottom)
    const color1 = "#f9f54d"
    const color2 = "transparent"

    gradientBg.addColorStop(0.3, color1)
    gradientBg.addColorStop(1, color2)

    return gradientBg
}

export const BarGraph = () => {
    const options = {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
            legend: {
                display: false,
            },
        },
        scales: {
            x: {
                grid: {
                    drawOnChartArea: false
                },
                ticks: {
                    display: false
                }
            },
            y: {
                border:{dash: [10, 10]},
                grid: {
                    drawOnChartArea: true
                },
                ticks: {
                    color: "#fff"
                }
            }
        },
    }
    
    const data = {
        labels: [
            "Kinh doanh",
            "Marketing",
            "Dịch vụ khách hàng",
            "Tư vấn",
            "Hành chính"
        ],
        datasets: [
            {   
                
                data: [14000, 6800, 5000, 4700, 8000],
                backgroundColor:
                    (context) => {
                        const chart = context.chart;
                        const {ctx, chartArea} = chart;

                        if (!chartArea) {
                        return;
                        }

                        return [
                            getGradient1(ctx, chartArea), 
                            getGradient2(ctx, chartArea),
                            getGradient3(ctx, chartArea),
                            getGradient4(ctx, chartArea),
                            getGradient5(ctx, chartArea)
                        ];
                    },
                borderWidth: {
                    top: 5,
                    right: 0,
                    bottom: 0,
                    left: 0
                },
                borderColor: [
                    "#00f75f",
                    "#3c45bd",
                    "#F76F00",
                    "#00F7E9",
                    "#F7F100"
                ],
            }
        ]
    }
    
    return <Bar options={options} data={data} />
}