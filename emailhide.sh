#!/bin/bash


# The license for this script can be found here:
# https://raw.githubusercontent.com/JessSystemV/EmailHide/main/LICENSE
# DO NOT REMOVE THIS NOTICE!

# Conceived and feverishly written on the 11th of January, 2024

# This was a very short and fun project, I sure hope it helps *someone.*

echo "EmailHide, A very very simple way to hide your email from probably very very dumb bots."

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <email>"
    exit 1
fi

email="$1"
encoded_email=$(echo -n "$email" | base64)

cat <<EOL
<!DOCTYPE html>
<html lang="en">
<body>

  <div id="emailContainer">Email: <span id="encodedEmail" onclick="decodeOnClick()">Click here.</span></div>

  <script type="text/javascript">
    function decodeText(encodedText) {
      return atob(encodedText);
    }

    // Copyright Jess H 2024, All rights reserved. 
    // https://raw.githubusercontent.com/JessSystemV/EmailHide/main/LICENSE
    // You can redistribute and repurpose this code but you may not remove the license!    

    // Decode and replace email on click
    function decodeOnClick() {
      var encodedEmail = "$encoded_email";
      var decodedEmail = decodeText(encodedEmail);
      document.getElementById('encodedEmail').innerHTML = '<a href="mailto:' + decodedEmail + '">' + decodedEmail + '</a>';
    }
  </script>

</body>
</html>
EOL
