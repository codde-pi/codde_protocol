use proc_macro::TokenStream;
use quote::quote;
use syn::{parse_macro_input, ItemStruct};

#[proc_macro_derive(Widget)]
pub fn widget_derive(input: TokenStream) -> TokenStream {
    let input = parse_macro_input!(input as ItemStruct);

    let name = &input.ident;

    let output = quote! {
        #[typetag::serde]
        impl Widget for #name {
            /* fn try_match(&self, s: &str) -> bool {
                s == self.
            }
            fn as_any(&self) -> &dyn Any {
                self
            } */

            /* fn get_identity(&self, id: u8) -> &str{
                &format!("{}_{}", stringify!(#name), id)
            } */

            /* fn name(&self) -> &str {
                stringify!(#name)
            } */
        }
    };

    // Return output TokenStream so your custom derive behavior will be attached.
    // TokenStream::from(output)
    output.into()
}

#[proc_macro_derive(ResultWidget)]
pub fn result_widget_derive(input: TokenStream) -> TokenStream {
    let input = parse_macro_input!(input as ItemStruct);

    let name = &input.ident;

    let output = quote! {
        #[typetag::serde]
        impl ResultWidget for #name {
        }
    };

    // Return output TokenStream so your custom derive behavior will be attached.
    // TokenStream::from(output)
    output.into()
}
