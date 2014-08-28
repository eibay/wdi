# Mailbox

# create a new Mailbox

# mailbox = Mailbox.new()

# mailbox.deliver({ from: "Your Mom", message: "I love you. Why don't you call?" })

# mailbox.received_mail
#=> [{ from: "Your Mom", message: "I love you. Why don't you call?" }]

# mailbox.deliver({ from: "Uncle Tony", message: "I like you face." })

# mailbox.received_mail
#=> [{ from: "Your Mom", message: "I love you. Why don't you call?" }, { from: "Uncle Tony", message: "I like you face." }]