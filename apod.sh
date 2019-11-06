# ==========
# Fetches NASA's Astronomy Picture of the Day (APOD) and sets it as the desktop background.
# Get your NASA API key here: https://api.nasa.gov
# ==========

# Configuration
NASA_API_KEY=#<Your API Key Here>
IMAGE_DIR=#<Absolute Path to Images Directory> e.g. /home/chris/.wallpapers
APOD_ENDPOINT=https://api.nasa.gov/planetary/apod?api_key=${NASA_API_KEY}

# Fetch the APOD from NASA API.
cd $IMAGE_DIR
image_url=$(curl -s ${APOD_ENDPOINT} | jq -r .url)  # The API returns a JSON response. We use 'jq' to extract the 'url' attribute.
file_name="APOD-$(date +%F).jpg"
wget -q -O $file_name $image_url

# Set the image as desktop background.
gsettings set org.gnome.desktop.background picture-uri file://$IMAGE_DIR/$file_name