# PairingRobot
An automated Pair Partner

Below are the notes I was making on the plane that lead to the creation of this system

Robot pairing system
------------------

* [ ] needs to be able to generate a test based on some spec
* [ ] given a test needs to be able to generate code to make is pass


Spec involves input/output, e.g. 2 => 4, 3 => 6, 4 => 8  (which implies a doubler)


Pair A writes:

```rb
describe 'doubler' do

  it 'doubles a number' do
    expect(double(2)).to eq 4
  end

end
```

Pair B writes:

```rb
def double(number)
  4
end
```

```rb
describe 'doubler' do

  it 'doubles a number' do
    expect(double(2)).to eq 4
  end

  it 'doubles a number' do
    expect(double(3)).to eq 6
  end

end
```

Pair A writes:


```rb
def double(number)
  4 if number == 2
  6
end
```

```rb
describe 'doubler' do

  it 'doubles a number' do
    expect(double(2)).to eq 4
  end

  it 'doubles a number' do
    expect(double(3)).to eq 6
  end

  it 'doubles a number' do
    expect(double(4)).to eq 8
  end

end
```

Pair B writes:

```rb
def double(number)
  number * 2
end
```

if they wrote

```rb
def double(number)
  4 if number == 2
  6 if number == 3
  8
end
```

they'd be missing out on a refactoring bonus ... what stops them going straight to the solution? is there some bonus for hard coding - you can't get the refactoring bonus until you've generated a certain amount of complexity ...?

interesting that I can create an RSpec example group in irb - although I think I need to declare a reporter to get the errors from running it out ...

can't just throw expects on irb --> probably can - check on SO

anyway, I guess the key component is automating the analysis of the stack trace:

```sh
2.3.0 :037 > begin ; triple(2) ; rescue => e ; puts e.message ; end
undefined method `triple' for main:Object
```


