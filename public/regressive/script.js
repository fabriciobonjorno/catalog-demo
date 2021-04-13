"use strict";
// styled components
document.documentElement.style.setProperty("--color-bg", "#22262E");
document.documentElement.style.setProperty("--color-heading", "#798EB0");
document.documentElement.style.setProperty("--color-counter", "#8973FD");
document.documentElement.style.setProperty("--font-family-heading", "Mukta");
const AppStyled = styled.div `
  background-image: linear-gradient(15deg, #1a1a1a, var(--color-bg));
  color: var(--color-text);
  display: flex;
  min-height: 100vh;
`;
const ContainerStyled = styled.section `
  margin: auto;
  padding: 1rem;

  @media (min-width: 48em) {
    padding: 4rem;
  }
`;
const WrapperStyled = styled.div `
  display: grid;
  grid-template-columns: repeat(2, minmax(0, 1fr));
  gap: 1rem;

  @media (min-width: 35.5em) {
    grid-template-columns: repeat(4, minmax(0, 1fr));
    gap: 0 2rem;
  }
`;
const DateStyled = styled.header `
  margin-bottom: 2rem;

  & h1 {
    color: var(--color-heading);
    font-family: var(--font-family-heading);
    font-size: clamp(1rem, 2vw, 99rem);
    font-weight: 300;
    letter-spacing: 0.1875em;
    margin: unset;
    text-align: center;
    text-transform: uppercase;
  }
`;
const CounterStyled = styled.div `
  background: rgba(255, 255, 255, 0.025);
  border-radius: 1rem;
  color: var(--color-counter);
  display: flex;
  flex-direction: column;
  font-family: "JetBrains Mono", mono;
  font-size: clamp(1rem, 8vw, 99rem);
  font-weight: 100;
  line-height: 1;
  padding: 2vw
  text-align: center;

  h2 {
    color: var(--color-heading);
    font-family: var(--font-family-heading);
    font-size: clamp(1rem, 2vw, 99rem);
    font-weight: 300;
    letter-spacing: .1875em;
    margin: 1.25rem 0 0;
    order: 1;
    overflow: hidden
    text-overflow: ellipsis;
    text-transform: uppercase;
    white-space: nowrap;
    width: 100%;
  }
`;
// timing
const nextYear = new Date().getFullYear() + 1;
const targetDate = new Date(`Jan 1, ${nextYear} 00:00:00`).getTime();
const generateTimeDisplay = () => {
    const rightJustNow = new Date().getTime();
    const runway = targetDate - rightJustNow;
    const stateObj = {
        days: Math.floor(runway / (1000 * 60 * 60 * 24)),
        hours: Math.floor((runway % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)),
        minutes: Math.floor((runway % (1000 * 60 * 60)) / (1000 * 60)),
        seconds: Math.floor((runway % (1000 * 60)) / 1000)
    };
    return stateObj;
};
// components
const Counter = ({ displayValue, label }) => (React.createElement(CounterStyled, null,
    React.createElement("h2", null, label),
    displayValue));
const App = () => {
    const [timeDisplay, setTimeDisplay] = React.useState(generateTimeDisplay);
    const updateCounters = () => setTimeDisplay(generateTimeDisplay);
    React.useEffect(() => {
        setInterval(() => setTimeDisplay(generateTimeDisplay), 1000);
    }, []);
    return (React.createElement(AppStyled, null,
        React.createElement(ContainerStyled, null,
            React.createElement(DateStyled, null,
                React.createElement("h1", null, "\uD83C\uDF89 New Year \uD83C\uDF89")),
            React.createElement(WrapperStyled, null,
                React.createElement(Counter, { displayValue: timeDisplay.days, label: "Days" }),
                React.createElement(Counter, { displayValue: timeDisplay.hours, label: "Hours" }),
                React.createElement(Counter, { displayValue: timeDisplay.minutes, label: "Minutes" }),
                React.createElement(Counter, { displayValue: timeDisplay.seconds, label: "Seconds" })))));
};
// mount
const theWholeEnchilada = document.createElement("div");
theWholeEnchilada.setAttribute("id", "theWholeEnchilada");
document.documentElement.append(theWholeEnchilada);
const app = document.querySelector("#theWholeEnchilada");
ReactDOM.render(React.createElement(App, null), theWholeEnchilada);