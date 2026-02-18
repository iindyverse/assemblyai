import assemblyai/operations.{create_transcript_response}
import gleam/bit_array
import gleam/http/response
import gleam/option.{Some}
import gleam/result
import simplifile.{read}

pub fn decode_transcript_response_ok_completed_test() {
  let assert Ok(transcript_response) = response_from_fixture()
  assert transcript_response.status == "completed"
}

pub fn decode_transcript_response_ok_language_detection_test() {
  let assert Ok(transcript_response) = response_from_fixture()
  assert transcript_response.language_detection == Some(True)
}

pub fn decode_transcript_response_ok_language_language_confidence_threshold_test() {
  let assert Ok(transcript_response) = response_from_fixture()
  assert transcript_response.language_confidence_threshold == Some(0.7)
}

fn response_from_fixture() {
  let assert Ok(body) =
    "./test/assemblyai/fixtures/post_v2_transcript_response_ok.json"
    |> read()
    |> result.map(bit_array.from_string)

  let assert Ok(response) =
    200
    |> response.new()
    |> response.set_body(body)
    |> create_transcript_response()
  response
}
