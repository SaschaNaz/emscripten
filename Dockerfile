# For travis
FROM saschanaz/emscripten:latest

RUN mkdir -p /root/emscripten/
COPY . /root/emscripten/

ARG TEST_TARGET
RUN cd /root/ \
 && touch -r .emscripten timestamp \
 && echo EMSCRIPTEN_ROOT="'/root/emscripten/'" >> .emscripten \
 && touch -r timestamp .emscripten \
 && python emscripten/tests/runner.py $TEST_TARGET skip:ALL.test_sse1_full skip:ALL.test_sse2_full skip:ALL.test_sse3_full skip:ALL.test_ssse3_full skip:ALL.test_sse4_1_full skip:other.test_native_link_error_message skip:other.test_bad_triple skip:ALL.test_binaryen skip:other.test_binaryen* skip:other.test_on_abort skip:other.test_sysconf_phys_pages skip:other.test_wasm_targets skip:other.test_symbol_map skip:other.test_legalize_js_ffi
