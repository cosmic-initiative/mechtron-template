
clean:
	rm -rf target || true
	rm *wasm || true
	rm bundle.zip || true



all: 
	RUSTFLAGS="--cfg tokio_unstable" CARGO_TARGET_DIR=./target cargo build --release --target wasm32-unknown-unknown
	cp ./target/wasm32-unknown-unknown/release/{{project-name}} bundle/wasm
	cd bundle && zip -r ../bundle.zip . 


debug: 
	cargo build --target wasm32-unknown-unknown
	cp ./target/wasm32-unknown-unknown/debug/{{project-name}}.wasm  .




	

