    doc = """
    Usage:
      json-range <x-start> <x-step> <x-end> <y-start> <y-step> <y-end>

    Options:
      -h --help                show this help message and exit
      --version                show version and exit

    Generate a flat list of X,Y pairs, which iterates X major, as JSON. This can
    then be passed through a template like mustache.
    """

    {docopt} = require 'docopt'
    options = docopt doc
    list = []

    y = Number(options['<y-start>'])
    yStep = Number(options['<y-step>'])
    yEnd = Number(options['<y-end>'])
    while y <= yEnd
      x = Number(options['<x-start>'])
      xStep = Number(options['<x-step>'])
      xEnd = Number(options['<x-end>'])
      while x <=xEnd
        list.push {x: x, y: y}
        x += xStep
      y += yStep

    console.log JSON.stringify list, null, 2
