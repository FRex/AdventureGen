page 'a' {
    title = 'Title A',
    text = 'Text of A',
    choices = {
        b = 'Go to B',
    }
}

page 'b' {
    title = 'Title B',
    text = 'Text of B',
    choices = {
        a = 'Go to A',
        ending = 'Go to ending.',
    }
}

page 'ending' {
    title = 'Ending',
    text = 'Ending ending ending.',
}
