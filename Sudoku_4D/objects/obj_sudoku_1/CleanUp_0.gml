for(var i=16;i<96;i++) {
    ds_list_destroy(_reduced_peers[| i]);
}
ds_list_destroy(_reduced_peers);
ds_list_destroy(_values);
