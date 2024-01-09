use proc_macro::TokenStream;
use quote::quote;
use syn::{parse_macro_input, ItemStruct};

#[proc_macro_derive(WidgetMatch)]
pub fn widget_match_derive(input: TokenStream) -> TokenStream {
    let input = parse_macro_input!(input as ItemStruct);

    let name = &input.ident;

    let output = quote! {
        impl #name {
            pub fn try_match(&self, s: &str) -> bool {
            s == "#name"
            }
        }
    };

    // Return output TokenStream so your custom derive behavior will be attached.
    TokenStream::from(output)
}
