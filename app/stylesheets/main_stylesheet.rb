class MainStylesheet < ApplicationStylesheet

  def setup
    # Add sytlesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_color = color.green
  end

  def search_label(st)
    st.frame = {left: 10, top: 80, width: app_width-20, height: 40, centered: :horizontal}
    st.text_alignment = :center
    st.color = color.black
    st.font = font.medium
    st.text = 'Flickr'
  end

  def query(st)
    st.frame = {left: 10, top: 130, width: app_width-20, height: 50, centered: :horizontal}
    st.font = font.large
    st.background_color = color.white
  end

  def submit_button(st)
    st.frame = {left: 10, top: 190, width: app_width-20, height: 40, centered: :horizontal}
    st.background_color = color.blue
    st.font = font.medium
    st.text = 'Search'
  end

end
