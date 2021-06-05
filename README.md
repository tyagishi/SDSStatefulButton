# SDSStatefulButton

<!--
comment
-->

## Feature

SDSStatefulButton is a Button which keeps boolean value internally.

and use adequate label depends on its boolean value.

## in 1min.
https://user-images.githubusercontent.com/6419800/120874493-deba5900-c5e1-11eb-9de3-9c3272f01428.mp4


## Code Example
```
struct ContentView: View {
    @State private var text: String = "value"
    var body: some View {
        VStack {
            SDSStatefulButton(true, trueLabel: {
                Image(systemName: "plus.app").resizable()
            }, falseLabel: {
                Image(systemName: "minus.square").resizable()
            }, onChange: { value in
                text = String("value is changed to \(value ? "true" : "false")")
            })
            .frame(width: 50, height: 50)
            Text(text)
            .padding()
        }
        .padding()
    }
}

```

## Installation
Use Swift Package Manager with URL: https://github.com/tyagishi/SDSStatefulButton

## Requirements
none

## Note
