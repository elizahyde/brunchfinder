class Sort

def compare_results
  # First compare (f)oursquare result names with (y)elp [specific to button push]. Need a similar test? Or use address?
  yelp_results.each do
    if yaddress == faddress
      top_results
      # Algorithm for sorting
    else
      reg_results
      # Save in case not enough to show...or fill at bottom? depends on how I do the UI.
    end
end

def sort_top_results
  # Metrics for top results: ftips_count, flikes_count, fhereNow_count, flists_count, fphotos_count
  # Might throw in yelp rating. Prob not in phase 1.

end